import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final String lectureId;
  final String subjectId;
  final String subjectName;
  final String day;
  final String startTime;
  final String endTime;
  final DateTime date;

  const LectureEntity({
    required this.lectureId,
    required this.subjectId,
    required this.subjectName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.date,
  });

  @override
  List<Object?> get props => [
    lectureId,
    subjectId,
    subjectName,
    day,
    startTime,
    endTime,
    date,
  ];
}
