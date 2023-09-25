import 'package:intl/intl.dart';

extension MyDateTimeUtils on DateTime {
  String format(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool get isSameDayAsToday {
    var now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  String get weekdayString {
    switch (weekday) {
      case DateTime.sunday:
        return "Sunday";
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
    }
    return "Saturday";
  }
}

extension MyDateTimeStringUtils on String {
  DateTime parseDate(String format) {
    return DateFormat(format, 'en_US').parse(this);
  }

  String parse(String fromFormat, String toFormat) {
    return parseDate(fromFormat).format(toFormat);
  }
}
