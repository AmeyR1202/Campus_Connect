import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final String lectureId;
  final String subjectId;
  final DateTime scheduledAt;
  final bool isCancelled;

  const LectureEntity({
    required this.lectureId,
    required this.subjectId,
    required this.scheduledAt,
    required this.isCancelled,
  });

  @override
  List<Object?> get props => [lectureId, subjectId, scheduledAt, isCancelled];
}
