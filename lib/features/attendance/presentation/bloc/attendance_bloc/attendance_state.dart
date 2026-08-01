import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_state.freezed.dart';

enum SubjectStatus { initial, loading, success, failure }

@freezed
sealed class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    @Default(SubjectStatus.initial) SubjectStatus status,
    @Default(false) bool isLoading,
    @Default([]) List<SubjectStats> subjectStats,
    List<AttendanceEntity>? attendance,
    List<String>? timetableSubjects,
    String? error,
    List<SubjectBaseStatsEntity>? baseStats,
  }) = _AttendanceState;
}
