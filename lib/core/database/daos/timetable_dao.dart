import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/tables/local_timetable_table.dart';
import 'package:drift/drift.dart';

part 'timetable_dao.g.dart';

@DriftAccessor(tables: [LocalTimetableTable])
class TimetableDao extends DatabaseAccessor<AppDatabase>
    with _$TimetableDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TimetableDao(super.db);

  // insertLecture
  Future<void> insertLecture(LocalTimetableTableCompanion lecture) async {
    await into(localTimetableTable).insert(lecture);
  }

  // updateLecture
  Future<void> updateLecture(
    String lectureId,
    LocalTimetableTableCompanion updatedLecture,
  ) async {
    await (update(
      localTimetableTable,
    )..where((tbl) => tbl.lectureId.equals(lectureId))).write(updatedLecture);
  }

  // markAsDeleted(String lectureId) (soft delete - sets isDeleted = true)
  Future<void> markAsDeleted(String lectureId) async {
    await (update(
      localTimetableTable,
    )..where((tbl) => tbl.lectureId.equals(lectureId))).write(
      LocalTimetableTableCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // markAsSynced(String lectureId) (sets isSynced = true)
  Future<void> markAsSynced(String lectureId) async {
    await (update(localTimetableTable)
          ..where((tbl) => tbl.lectureId.equals(lectureId)))
        .write(const LocalTimetableTableCompanion(isSynced: Value(true)));
  }

  // getLecturesForDay(String day) (must explicitly filter: where (isDeleted == false))
  Future<List<LocalTimetableTableData>> getLecturesForDay(String day) async {
    return await (select(
      localTimetableTable,
    )..where((tbl) => tbl.day.equals(day) & tbl.isDeleted.equals(false))).get();
  }

  // getAllLectures() (must explicitly filter: where (isDeleted == false))
  Future<List<LocalTimetableTableData>> getAllLectures() async {
    return await (select(
      localTimetableTable,
    )..where((tbl) => tbl.isDeleted.equals(false))).get();
  }

  // getUnsyncedLectures() (where isSynced == false OR isDeleted == true)
  Future<List<LocalTimetableTableData>> getUnsyncedLectures() async {
    return await (select(localTimetableTable)..where(
          (tbl) => tbl.isSynced.equals(false) | tbl.isDeleted.equals(true),
        ))
        .get();
  }
}
