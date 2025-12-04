import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    final formatter = NumberFormat('$symbol#,##0.00');
    return formatter.format(amount);
  }

  static String formatCurrencyShort(double amount, {String symbol = '\$'}) {
    if (amount >= 1000000) {
      return '$symbol${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '$symbol${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return '$symbol${amount.toStringAsFixed(0)}';
    }
  }
}
