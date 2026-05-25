import 'package:campus_connect/core/database/app_database.dart';

export 'local_timetable_datasource_impl.dart';

abstract interface class LocalTimetableDatasource {
  // cache Lecture
  Future<void> cacheLecture(LocalTimetableTableCompanion lecture);

  // update lecture
  Future<void> updateLecture(
    String lectureId,
    LocalTimetableTableCompanion lecture,
  );

  // mark as delete
  Future<void> markAsDeleted(String lectureId);

  // hard delete
  Future<void> hardDeleteLecture(String lectureId);

  // mark as synced
  Future<void> markAsSynced(String lectureId);

  // get lectures for a particular day
  Future<List<LocalTimetableTableData>> getLecturesForDay(String date);

  // get all the lectures
  Future<List<LocalTimetableTableData>> getAllLectures();

  // get unsynced lectures
  Future<List<LocalTimetableTableData>> getUnsyncedLectures();
}
