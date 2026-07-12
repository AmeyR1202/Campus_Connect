import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/tables/local_attendance_table.dart';
import 'package:drift/drift.dart';

part 'attendance_dao.g.dart';

@DriftAccessor(tables: [LocalAttendanceTable])
class AttendanceDao extends DatabaseAccessor<AppDatabase>
    with _$AttendanceDaoMixin {
  AttendanceDao(super.db);

  // Inserts or replaces a list of records.
  Future<void> cacheAttendance(List<LocalAttendanceTableCompanion> list) async {
    await batch((batch) {
      batch.insertAll(
        localAttendanceTable,
        list,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  // Inserts or replaces a single record.
  Future<void> upsertAttendance(LocalAttendanceTableCompanion record) async {
    await into(localAttendanceTable).insertOnConflictUpdate(record);
  }

  // Returns all attendance records for a subject (filtering out isDeleted == true).
  Future<List<LocalAttendanceTableData>> getAttendance(String subjectId) async {
    return (select(localAttendanceTable)
          ..where((tbl) => tbl.subjectId.equals(subjectId))
          ..where((tbl) => tbl.isDeleted.equals(false)))
        .get();
  }

  // Returns all records where isSynced == false.
  Future<List<LocalAttendanceTableData>> getUnsyncedRecords() async {
    return (select(
      localAttendanceTable,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  // Updates a record to set isSynced = true.
  Future<void> markAsSynced(String lectureId) async {
    await (update(localAttendanceTable)
          ..where((tbl) => tbl.lectureId.equals(lectureId)))
        .write(const LocalAttendanceTableCompanion(isSynced: Value(true)));
  }

  // Returns ALL attendance records across all subjects
  Future<List<LocalAttendanceTableData>> getAllAttendance() async {
    return (select(
      localAttendanceTable,
    )..where((tbl) => tbl.isDeleted.equals(false))).get();
  }
}
