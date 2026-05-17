import 'dart:io';
import 'package:campus_connect/core/database/tables/local_attendance_table.dart';
import 'package:campus_connect/core/database/tables/local_timetable_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [LocalTimetableTable, LocalAttendanceTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    /// comes from path_provider: Where should app store persistent files?
    /// return something like private app storage directory => /data/user/0/com.app/files/

    final file = File(
      p.join(dbFolder.path, 'campus_connect.sqlite'),
    ); // creates path to actual SQLite file

    return NativeDatabase.createInBackground(
      file,
    ); // open SQLite on background isolate/thread **NOT main UI thread.**
    /// If database initialization happens on main thread:
    /// // frame drops, jank, startup lag can occur
  });
}
