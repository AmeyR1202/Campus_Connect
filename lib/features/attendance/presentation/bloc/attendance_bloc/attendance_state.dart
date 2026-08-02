import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_state.freezed.dart';

enum SubjectStatus { initial, loading, success, failure }

@freezed
abstract class AttendanceState with _$AttendanceState {
  const AttendanceState._(); // Required for custom methods/getters

  const factory AttendanceState({
    @Default(SubjectStatus.initial) SubjectStatus status,
    @Default(false) bool isLoading,
    @Default([]) List<SubjectStats> subjectStats,
    List<AttendanceEntity>? attendance,
    List<String>? timetableSubjects,
    String? error,
    List<SubjectBaseStatsEntity>? baseStats,
  }) = _AttendanceState;

  List<SubjectStats> get safeSubjects => subjectStats.where((s) => s.isSafe).toList();
  List<SubjectStats> get dangerSubjects => subjectStats.where((s) => !s.isSafe).toList();

  AttendanceEntity? getAttendanceForLecture(String lectureId) {
    if (attendance == null || attendance!.isEmpty) return null;
    try {
      return attendance!.firstWhere((a) => a.lectureId == lectureId);
    } catch (_) {
      return null;
    }
  }

  int get totalClasses => subjectStats.fold(0, (sum, s) => sum + s.total);
  int get totalAttended => subjectStats.fold(0, (sum, s) => sum + s.attended);
  double get overallPercentage => totalClasses == 0 ? 0.0 : (totalAttended / totalClasses) * 100;
}