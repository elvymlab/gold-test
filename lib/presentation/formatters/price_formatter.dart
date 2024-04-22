import 'package:intl/intl.dart';

class PriceFormatter {
  static const decimalDigits = 0;
  static const symbol = '\u20BD';
  final _priceFormatter = NumberFormat.currency(
    locale: 'ru_RU',
    decimalDigits: decimalDigits,
    symbol: symbol,
  );

  String format<Type extends num?>(Type price) {
    return _priceFormatter.format(price);
  }
}
