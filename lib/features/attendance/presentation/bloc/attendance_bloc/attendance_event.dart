import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_event.freezed.dart';

@freezed
sealed class AttendanceEvent with _$AttendanceEvent {
  // 1. Get attendance
  const factory AttendanceEvent.fetchAttendance({
    required String userId,
    String? subjectId,
  }) = FetchAttendanceEvent;

  // 2. AddAttendanceEvent
  const factory AttendanceEvent.addAttendance({
    required String userId,
    required AttendanceEntity entity,
  }) = AddAttendanceEvent;

  // 3. FetchAllSubjectsStatsEvent
  const factory AttendanceEvent.fetchAllSubjectsStatsEvent({
    required String userId,
    List<String>? timetableSubjects,
  }) = FetchAllSubjectsStatsEvent;

  // 4. Update Lecture Event
  const factory AttendanceEvent.updateLectureEvent({
    required String userId,
    required String subjectId,
    required String lectureId,
    required AttendanceStatus status,
  }) = UpdateLectureEvent;

  // 5. SetBaseStatsEvent
  const factory AttendanceEvent.setBaseStatsEvent({
    required String userId,
    required String subjectId,
    required int attended,
    required int missed,
    required int cancelled,
  }) = SetBaseStatsEvent;

  // 6. SyncAttendanceDataEvent
  const factory AttendanceEvent.syncAttendanceDataEvent({
    required String userId,
  }) = SyncAttendanceDataEvent;
}
