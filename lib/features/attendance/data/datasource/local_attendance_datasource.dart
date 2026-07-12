import 'package:campus_connect/core/database/app_database.dart';

abstract interface class LocalAttendanceDatasource {
  // Inserts or replaces a list of records.
  Future<void> cacheAttendance(List<LocalAttendanceTableCompanion> list);

  // Inserts or replaces a single record.
  Future<void> upsertAttendance(LocalAttendanceTableCompanion record);

  // Returns all attendance records for a subject (filtering out isDeleted == true).
  Future<List<LocalAttendanceTableData>> getAttendance(String subjectId);

  // Returns all records where isSynced == false.
  Future<List<LocalAttendanceTableData>> getUnsyncedLectures();

  // Updates a record to set isSynced = true.
  Future<void> markAsSynced(String id);

  Future<List<LocalAttendanceTableData>> getAllAttendance();

  // --- Base Stats ---
  Future<void> cacheBaseStats(List<LocalBaseStatsTableCompanion> list);
  Future<void> upsertBaseStats(LocalBaseStatsTableCompanion record);
  Future<List<LocalBaseStatsTableData>> getAllBaseStats();
  Future<List<LocalBaseStatsTableData>> getUnsyncedBaseStats();
  Future<void> markBaseStatsAsSynced(String subjectId);
}
