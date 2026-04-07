import 'package:campus_connect/features/timetable/domain/enums/lecture_enum.dart';
import 'package:campus_connect/features/timetable/domain/enums/weekday_enum.dart';
import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final String lectureId;
  final String subjectName;
  final Weekday day; // "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
  final String startTime;
  final String endTime;
  final String colorHex;
  final Lecture type; // "lecture" | "lab" | "tutorial"
  final DateTime date;

  const LectureEntity({
    required this.lectureId,
    required this.subjectName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.colorHex,
    required this.type,
    required this.date,
  });

  @override
  List<Object?> get props => [
    lectureId,
    subjectName,
    day,
    startTime,
    endTime,
    colorHex,
    type,
    date,
  ];
}
