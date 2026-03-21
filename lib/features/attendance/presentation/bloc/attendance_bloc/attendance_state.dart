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
import 'package:campus_connect/features/attendance/domain/entities/stats_entity.dart';
import 'package:equatable/equatable.dart';

class AttendanceState extends Equatable {
  final bool isLoading;
  final List<AttendanceEntity>? attendance;
  final StatsEntity? stats;
  final String? error;

  const AttendanceState({
    this.isLoading = false,
    this.attendance,
    this.stats,
    this.error,
  });

  AttendanceState copyWith({
    bool? isLoading,
    List<AttendanceEntity>? attendance,
    StatsEntity? stats,
    String? error,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      attendance: attendance ?? this.attendance,
      stats: stats ?? this.stats,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, attendance, stats, error];
}
