import 'package:flutter_flix_id/data/repositories/transaction_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';

class CreateTransaction
    implements Usecase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParam params) async {

    var result = await _transactionRepository.createTransaction(
      transaction: params.transaction,
    );

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: final message) => Result.failed(message),
    };
  }
}
