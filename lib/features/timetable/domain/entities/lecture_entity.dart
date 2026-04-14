import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final String lectureId;

  final String subjectName;
  final String day;
  final String startTime;
  final String endTime;
  final String type;

  const LectureEntity({
    required this.lectureId,

    required this.subjectName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.type,
  });

  @override
  List<Object?> get props => [
    lectureId,

    subjectName,
    day,
    startTime,
    endTime,
    type,
  ];
}
