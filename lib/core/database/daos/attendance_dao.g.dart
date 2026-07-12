// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_dao.dart';

// ignore_for_file: type=lint
mixin _$AttendanceDaoMixin on DatabaseAccessor<AppDatabase> {
  $LocalAttendanceTableTable get localAttendanceTable =>
      attachedDatabase.localAttendanceTable;
  AttendanceDaoManager get managers => AttendanceDaoManager(this);
}

class AttendanceDaoManager {
  final _$AttendanceDaoMixin _db;
  AttendanceDaoManager(this._db);
  $$LocalAttendanceTableTableTableManager get localAttendanceTable =>
      $$LocalAttendanceTableTableTableManager(
        _db.attachedDatabase,
        _db.localAttendanceTable,
      );
}
