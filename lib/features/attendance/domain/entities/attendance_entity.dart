import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable {
  final String lectureId;
  final String subjectId;
  final AttendanceStatus status;
  final DateTime markedAt;

  const AttendanceEntity({
    required this.lectureId,
    required this.subjectId,
    required this.status,
    required this.markedAt,
  });

  @override
  List<Object?> get props => [lectureId, subjectId, status, markedAt];
}

enum AttendanceStatus { present, absent, cancelled, late, excused }
