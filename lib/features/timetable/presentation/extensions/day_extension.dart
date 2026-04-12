import 'package:campus_connect/features/timetable/domain/enums/day.dart';

extension DayX on Day {
  String get displayDay {
    switch (this) {
      case Day.mon:
        return "Monday";
      case Day.tue:
        return "Tuesday";
      case Day.wed:
        return "Wednesday";
      case Day.thu:
        return "Thursday";
      case Day.fri:
        return "Friday";
      case Day.sat:
        return "Saturday";
      case Day.sun:
        return "Sunday";
    }
  }
}
