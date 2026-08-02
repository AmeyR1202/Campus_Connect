import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/*
  1. Add Lecture Event
  2. Delete Lecture Event
  3. Get Lectures For Day Event
  4. Get All Lectures Event
  5. Update Lecture Event
  6. Sync Data Event
 */

part 'timetable_event.freezed.dart';

@freezed
sealed class TimetableEvent with _$TimetableEvent {
  // 1. Add Lecture Event
  const factory TimetableEvent.addLectureEvent({
    required String userId,
    required LectureEntity entity,
  }) = AddLectureEvent;

  // 2. Delete Lecture Event
  const factory TimetableEvent.deleteLectureEvent({
    required String userId,
    required String lectureId,
  }) = DeleteLectureEvent;

  // 3. Get Lectures For Day Event
  const factory TimetableEvent.getLecturesForDayEvent({
    required String userId,
    required DateTime date,
  }) = GetLecturesForDayEvent;

  // 4. Get All Lectures Event
  const factory TimetableEvent.getAllLecturesEvent({required String userId}) =
      GetAllLecturesEvent;

  // 5. Update Lecture Event
  const factory TimetableEvent.updateLectureEvent({
    required String userId,
    required LectureEntity entity,
  }) = UpdateLectureEvent;

  //  6. Sync Data Event
  const factory TimetableEvent.syncDataEvent({required String userId}) =
      SyncDataEvent;
}
