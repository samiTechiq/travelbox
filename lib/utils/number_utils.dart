import 'package:intl/intl.dart';

class NumberUtils {
  static String formatPriceNumber(double price) {
    final oCcy = NumberFormat("#,##0.00");
    return oCcy.format(price);
  }
}
