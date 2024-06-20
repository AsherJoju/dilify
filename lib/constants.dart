import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

String getRandomUuid() => uuid.v4();
String toDateTimeRangeString(DateTimeRange range) {
  DateTime start = range.start;
  DateTime end = range.end;

  // Get month abbreviation
  String getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  // Check if start and end dates are the same
  if (start.year == end.year && start.month == end.month && start.day == end.day) {
    return '${start.day} ${getMonthAbbreviation(start.month)}, ${start.year}';
  }

  // Check if start and end years are different
  else if (start.year != end.year) {
    return '${start.day} ${getMonthAbbreviation(start.month)}, ${start.year} - '
        '${end.day} ${getMonthAbbreviation(end.month)}, ${end.year}';
  }

  // Check if start and end months are different
  else if (start.month != end.month) {
    return '${start.day} ${getMonthAbbreviation(start.month)} - '
        '${end.day} ${getMonthAbbreviation(end.month)}, ${start.year}';
  }

  // If start and end dates are within the same month and year
  else {
    return '${start.day} - ${end.day} ${getMonthAbbreviation(start.month)}, ${start.year}';
  }
}
