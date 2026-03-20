import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {}

class FetchAttendanceEvent extends AttendanceEvent {
  final String userId;
  final String subjectId;

  FetchAttendanceEvent({required this.userId, required this.subjectId});

  @override
  List<Object?> get props => [userId, subjectId];
}

class FetchStatsEvent extends AttendanceEvent {
  final String userId;
  final String subjectId;

  FetchStatsEvent({required this.userId, required this.subjectId});

  @override
  List<Object?> get props => [userId, subjectId];
}

class AddAttendanceEvent extends AttendanceEvent {
  final String userId;
  final AttendanceEntity entity;

  AddAttendanceEvent({required this.userId, required this.entity});

  @override
  List<Object?> get props => [userId, entity];
}
