import 'package:intl/intl.dart';

class MyDateFormatter {
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  /// Checks if the date is yesterday
  static bool isYesterday(DateTime dateTime) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
  }

  static String dateStringDayMonthYear(DateTime? dateTime) {
    return DateFormat('d MMM,y').format(dateTime!);
  }

  static String dateStringMonthYear(DateTime? dateTime) {
    return DateFormat('MMMM y').format(dateTime!);
  }

  static String dateStringMonth(DateTime? dateTime) {
    return DateFormat('d MMM').format(dateTime!);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
        .parse(dateTime, true)
        .toLocal();
  }

  static String localDateToIsoStringAMPM(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime.toLocal());
  }

  static String supportTicketDateFormat(DateTime dateTime) {
    return DateFormat('h:mm a dd MMM,yyyy').format(dateTime.toLocal());
  }

  static String localDateToIsoStringAMPMOrder(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, h:mm a ').format(dateTime.toLocal());
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd:MM:yy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
  }

  static String isoStringToLocalDateAndTime(String dateTime) {
    return DateFormat('dd-MMM-yyyy hh:mm a')
        .format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateAndTimeConversation(String dateTime) {
    return DateFormat('dd MMM yyyy \'at\' ${_timeFormatter()}')
        .format(isoUtcStringToLocalDate(dateTime));
  }

  static DateTime isoUtcStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
        .parse(dateTime, true)
        .toLocal();
  }

  static String dateFormatForWalletBonus(String dateTime) {
    return DateFormat('dd MMM, yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String dateTimeStringToDateTime(String dateTime) {
    return DateFormat('dd MMM, yyyy')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateTime));
  }

  static String dateTimeStringToDateAndTime(String dateTime) {
    return DateFormat('hh:mm a, dd MMM yyyy')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateTime));
  }

  static String dateTimeStringToMonthDateAndTime(String dateTime) {
    return DateFormat('MMMM d, yyyy')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateTime));
  }

  static String refundDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateTime));
  }

  static String estimatedDateYear(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String inboxLocalDateToIsoStringAMPM(DateTime dateTime) {
    return DateFormat('${_timeFormatter()} | dd-MMM-yyyy ')
        .format(dateTime.toLocal());
  }

  static DateTime isoUtcStringToLocalTimeOnly(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
        .parse(dateTime, true)
        .toLocal();
  }

  static String convertStringTimeToDate(DateTime time) {
    return DateFormat('EEE \'at\' ${_timeFormatter()}').format(time.toLocal());
  }

  static String convertStringTimeToDateChatting(DateTime time) {
    return DateFormat('EEE \'at\' ${_timeFormatter()}').format(time.toLocal());
  }

  static String convert24HourTimeTo12HourTimeWithDay(
      DateTime time, bool isToday, bool isYesterday) {
    if (isToday) {
      return DateFormat('\'Today at\' hh:mm a').format(time);
    } else if (isYesterday) {
      return DateFormat('\'Yesterday at\' hh:mm a').format(time);
    } else {
      return DateFormat('EEE \'at\' hh:mm a').format(time);
    }
  }

  static String convert24HourTimeTo12HourTime(DateTime time) {
    return DateFormat(_timeFormatter()).format(time);
  }

  static String _timeFormatter() {
    return '24';
  }

  static String customTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(const Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'just now';
    }

    String roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'yesterday';
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(dateTime.toLocal());

      return weekday;
    }

    return localDateToIsoStringAMPM(dateTime);
  }

  static int countDays(DateTime? dateTime) {
    final startDate = dateTime!;
    final endDate = DateTime.now();
    final difference = endDate.difference(startDate).inDays;
    return difference;
  }
}
