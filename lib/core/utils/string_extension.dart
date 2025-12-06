import 'package:intl/intl.dart';

extension StringExtension on String? {
  static String formatMoney(double? value) {
    if (value == null) return '0';

    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );

    return formatter.format(value);
  }

  static String capitalize(String value) => value.isEmpty ? value : '${value[0].toUpperCase()}${value.substring(1)}';
}
