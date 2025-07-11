import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/usecases/get_user_balance/get_user_balance_param.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';

class GetUserBalance implements Usecase<Result<int>, GetUserBalanceParam> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<int>> call(GetUserBalanceParam params) async {
    final result = await _userRepository.getUser(uid: params.userId);

    return switch (result) {
      Success(value: final user) => Result.success(user.balance),
      Failed(:final message) => Result.failed(message),
    };
  }
}
