import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/features/attendance/data/datasource/local_attendance_datasource.dart';

class LocalAttendanceDatasourceImpl implements LocalAttendanceDatasource {
  final AppDatabase database;

  LocalAttendanceDatasourceImpl(this.database);

  @override
  Future<void> cacheAttendance(List<LocalAttendanceTableCompanion> list) async {
    await database.attendanceDao.cacheAttendance(list);
  }

  @override
  Future<List<LocalAttendanceTableData>> getAttendance(String subjectId) async {
    return await database.attendanceDao.getAttendance(subjectId);
  }

  @override
  Future<List<LocalAttendanceTableData>> getUnsyncedLectures() async {
    return await database.attendanceDao.getUnsyncedRecords();
  }

  @override
  Future<void> markAsSynced(String id) async {
    await database.attendanceDao.markAsSynced(id);
  }

  @override
  Future<void> upsertAttendance(LocalAttendanceTableCompanion record) async {
    await database.attendanceDao.upsertAttendance(record);
  }

  @override
  Future<List<LocalAttendanceTableData>> getAllAttendance() async {
    return await database.attendanceDao.getAllAttendance();
  }

  // --- Base Stats ---
  @override
  Future<void> cacheBaseStats(List<LocalBaseStatsTableCompanion> list) async {
    await database.baseStatsDao.cacheBaseStats(list);
  }

  @override
  Future<void> upsertBaseStats(LocalBaseStatsTableCompanion record) async {
    await database.baseStatsDao.upsertBaseStats(record);
  }

  @override
  Future<List<LocalBaseStatsTableData>> getAllBaseStats() async {
    return await database.baseStatsDao.getAllBaseStats();
  }

  @override
  Future<List<LocalBaseStatsTableData>> getUnsyncedBaseStats() async {
    return await database.baseStatsDao.getUnsyncedRecords();
  }

  @override
  Future<void> markBaseStatsAsSynced(String subjectId) async {
    await database.baseStatsDao.markAsSynced(subjectId);
  }
}
