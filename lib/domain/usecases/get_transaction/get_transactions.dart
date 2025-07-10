import 'package:flutter_flix_id/data/repositories/transaction_repository.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/entities/transaction.dart';
import 'package:flutter_flix_id/domain/usecases/get_transaction/get_transactios_param.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';

class GetTransactions
    implements Usecase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionListResult = await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
