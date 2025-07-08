import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance; 

// Create User
  @override
  Future<Result<User>> createUser(
    {required String uid, required String email, required String name, String? photoUrl, int balance = 0,}) async {
    CollectionReference<Map<String, dynamic>> users = 
    _firebaseFirestore.collection('users');

    await users.doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'balance': balance,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return Result.failed('Failed to create user data');
    }
  }
  @override
  Future<Result<User>> getUser({required String uid}) async{
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return Result.failed('User not found');
    }
  }

// Get User Balance
  @override
  Future<Result<User>> getUserBalance({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!['balance']));
    } else {
      return Result.failed('User not found');
    }
  }

// Update User
  @override
  Future<Result<User>> updateUser({required User user}) async {
   try {DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/${user.uid}');
    await documentReference.update(user.toJson());
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();
    if (result.exists) {
      User updatedUser = User.fromJson(result.data()!);
      if (updatedUser == user) {
        return Result.success(updatedUser);
      } else {
        return const Result.failed('Failed to update user data');
      }
    } else {
      return const Result.failed('Failed to update user data');
    }} on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user data');
    }
  }

// Update User Balance
  @override
  Future<Result<User>> updateUserBalance({required String uid, required int balance}) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();
    if (result.exists) {
      await documentReference.update({'balance': balance});
      DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();
      if (result.exists) {
        User updatedUser = User.fromJson(result.data()!);
        if (updatedUser.balance == balance) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user balance');
        }
      } else {
        return Result.failed('Failed to retrive updated user balance');
      }
    } else {
      return Result.failed('User not found');
    }
  }

// Upload Profile Picture
  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) async {
    String filename = basename(imageFile.path);

    Reference reference = FirebaseStorage.instance.ref().child(filename);

  try {
    await reference.putFile(imageFile);

    String downloadUrl = await reference.getDownloadURL();
    var updatedResult = await updateUser(user: user.copyWith(photoUrl: downloadUrl));

    if (updatedResult.isSuccess) {
      return Result.success(updatedResult.resultValue!);
    } else {
      return Result.failed(updatedResult.errorMessage!);
    }

  } catch (e) {
    return const Result.failed('Failed to upload profile picture');
  }
  }

}