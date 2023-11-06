import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateAndTime(String dateAndTime) {
    final startDateTime = DateTime.parse(dateAndTime);

    final dateFormat = DateFormat('d MMM y | h:mma');
    final formattedDateAndTime = dateFormat.format(startDateTime);

    return formattedDateAndTime;
  }

  static String formatTimeRange(String startTime, String endTime) {
    final startDateTime = DateTime.parse("2023-10-30 $startTime");
    final endDateTime = DateTime.parse("2023-10-30 $endTime");

    final timeFormat = DateFormat.jm();
    final startFormatted = timeFormat.format(startDateTime);
    final endFormatted = timeFormat.format(endDateTime);

    return '$startFormatted - $endFormatted';
  }
  static String formatDateRange(String startDate, String endDate) {
    final startDateTime = DateTime.parse(startDate);
    final endDateTime = DateTime.parse(endDate);

    final dateFormat = DateFormat.MMMd();
    final startFormatted = dateFormat.format(startDateTime);
    final endFormatted = dateFormat.format(endDateTime);

    return '$startFormatted - $endFormatted';
  }

  static String formatTimeRanges(String startTime, String endTime) {
    final startDateTime = DateTime.parse("2023-10-30 $startTime");
    final endDateTime = DateTime.parse("2023-10-30 $endTime");

    final timeFormat = DateFormat.jm();
    final startFormatted = timeFormat.format(startDateTime);
    final endFormatted = timeFormat.format(endDateTime);

    return '$startFormatted - $endFormatted';
  }
}
