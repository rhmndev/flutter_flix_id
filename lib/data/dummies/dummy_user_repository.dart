import 'dart:io';

import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> createUser({required String uid, required String email, required String name, String? photoUrl, int balance = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(User(uid: uid, email: 'dummy@dummy.com', name: 'dummy'));
  }

  @override
  Future<Result<User>> getUserBalance({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance({required String uid, required int balance}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) {
    throw UnimplementedError();
  }
}