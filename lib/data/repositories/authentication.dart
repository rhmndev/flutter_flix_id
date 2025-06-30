import 'package:flutter_flix_id/domain/entities/result.dart';

abstract interface class Authentication {
  //method untuk register
  Future<Result<String>> register({
    required String email,
    required String password,
  });

  //method untuk login
  Future<Result<String>> login({
    required String email,
    required String password,
  });

  //method untuk logout tanpa mengembalikan apapun
  Future<Result<void>> logout();

  //untuk mengambil log dari User ID
  String? getLoggedInUserId();
}
