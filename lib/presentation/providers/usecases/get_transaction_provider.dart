import 'package:flutter_flix_id/domain/usecases/get_transaction/get_transactions.dart';
import 'package:flutter_flix_id/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_transaction_provider.g.dart';

@riverpod
GetTransactions getTransactions(GetTransactionsRef ref) => GetTransactions(
  transactionRepository: ref.watch(transactionRepositoryProvider),
);
