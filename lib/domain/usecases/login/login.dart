import 'package:flutter_flix_id/data/repositories/authentication.dart';
import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements Usecase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});


  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(email: params.email, password: params.password);

    if (idResult is Success) {
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
      
}