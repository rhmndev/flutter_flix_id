import 'package:flutter_flix_id/data/repositories/authentication.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';

class DummyAuthentication implements Authentication {
  @override
  String? getLoggedInUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Result.success('ID-12345');
    // return Result.failed('Login failed');
  }

  @override
  Future<Result<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({required String email, required String password}) {
    throw UnimplementedError();
  }
}