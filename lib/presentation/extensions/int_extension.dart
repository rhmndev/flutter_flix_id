import 'package:intl/intl.dart';

extension IntExtension on int {
  String toIDRCurrencyFormat() => NumberFormat.currency(
    locale: 'id',
    symbol: "IDR",
    decimalDigits: 0,
  ).format(this);
}

