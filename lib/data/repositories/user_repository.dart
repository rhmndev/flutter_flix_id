import 'dart:io';

import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';

abstract interface class UserRepository {
  //untuk membuat user baru
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  //untuk get User
  Future<Result<User>> getUser({required String uid});
  //untuk update User
  Future<Result<User>> updateUser({required User user});
  //untuk get User balance/saldo
  Future<Result<User>> getUserBalance({required String uid});
  //untuk update user balance/saldo
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  });
  //untuk upload profile picture user
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File imageFile,
  });
}
