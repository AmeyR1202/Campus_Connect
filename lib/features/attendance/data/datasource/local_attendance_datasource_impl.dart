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
}
