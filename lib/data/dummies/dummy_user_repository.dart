import 'dart:io';

import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> createUser({required String uid, required String email, required String name, String? photoUrl, int balance = 0}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(User(uid: uid, email: 'dummy@dummy.com', name: 'dummy'));
  }

  @override
  Future<Result<User>> getUserBalance({required String uid}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance({required String uid, required int balance}) {
    // TODO: implement updateUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}