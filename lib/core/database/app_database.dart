import 'dart:io';
import 'package:campus_connect/core/database/daos/timetable_dao.dart';
import 'package:campus_connect/core/database/tables/local_timetable_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [LocalTimetableTable], daos: [TimetableDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Development only: Recreate all tables when schema version bumps.
        // In a production app, you would write step-by-step SQL migrations here.
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      },
    );
  }
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
