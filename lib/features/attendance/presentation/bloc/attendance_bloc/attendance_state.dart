// import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
// import 'package:campus_connect/features/attendance/domain/entities/stats_entity.dart';

// abstract class AttendanceState {}

// class AttendanceInitial extends AttendanceState {}

// class AttendanceLoading extends AttendanceState {}

// class AttendanceLoaded extends AttendanceState {
//   final List<AttendanceEntity> attendance;

//   AttendanceLoaded(this.attendance);
// }

// class StatsLoaded extends AttendanceState {
//   final StatsEntity stats;

//   StatsLoaded(this.stats);
// }

// class AttendanceError extends AttendanceState {
//   final String message;

//   AttendanceError(this.message);
// }

import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:equatable/equatable.dart';

enum SubjectStatus { initial, loading, success, failure }

class AttendanceState extends Equatable {
  final SubjectStatus status;
  final bool isLoading;
  final List<AttendanceEntity>? attendance;
  final List<SubjectStats> subjectStats;
  final String? error;

  const AttendanceState({
    this.status = SubjectStatus.initial,
    this.subjectStats = const [],
    this.isLoading = false,
    this.attendance,
    this.error,
  });

  AttendanceState copyWith({
    SubjectStatus? status,
    List<SubjectStats>? subjectStats,
    bool? isLoading,
    List<AttendanceEntity>? attendance,
    String? error,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      subjectStats: subjectStats ?? this.subjectStats,
      attendance: attendance ?? this.attendance,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    status,
    subjectStats,
    isLoading,
    attendance,
    error,
  ];
}
