// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_dao.dart';

// ignore_for_file: type=lint
mixin _$TimetableDaoMixin on DatabaseAccessor<AppDatabase> {
  $LocalTimetableTableTable get localTimetableTable =>
      attachedDatabase.localTimetableTable;
  TimetableDaoManager get managers => TimetableDaoManager(this);
}

class TimetableDaoManager {
  final _$TimetableDaoMixin _db;
  TimetableDaoManager(this._db);
  $$LocalTimetableTableTableTableManager get localTimetableTable =>
      $$LocalTimetableTableTableTableManager(
        _db.attachedDatabase,
        _db.localTimetableTable,
      );
}
