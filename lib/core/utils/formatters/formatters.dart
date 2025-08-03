import 'package:intl/intl.dart';

class MyFormatters {
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatphoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
    } else if (phoneNumber.length == 12) {
      return '+${phoneNumber.substring(0, 2)} ${phoneNumber.substring(2, 5)} ${phoneNumber.substring(5, 8)} ${phoneNumber.substring(8, 12)}';
    } else {
      return phoneNumber;
    }
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    final groupSizes = [3, 3, 4];
    int i = 0;
    int groupIndex = 0;

    while (i < digitsOnly.length && groupIndex < groupSizes.length) {
      int groupLength = groupSizes[groupIndex];
      int end = (i + groupLength <= digitsOnly.length)
          ? i + groupLength
          : digitsOnly.length;
      formattedNumber.write(digitsOnly.substring(i, end));
      i = end;
      if (i < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      groupIndex++;
    }

    return formattedNumber.toString();
  }
}
