import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/tables/local_base_stats_table.dart';
import 'package:drift/drift.dart';

part 'base_stats_dao.g.dart';

@DriftAccessor(tables: [LocalBaseStatsTable])
class BaseStatsDao extends DatabaseAccessor<AppDatabase> with _$BaseStatsDaoMixin {
  BaseStatsDao(super.db);

  Future<void> upsertBaseStats(LocalBaseStatsTableCompanion record) async {
    await into(localBaseStatsTable).insertOnConflictUpdate(record);
  }

  Future<void> cacheBaseStats(List<LocalBaseStatsTableCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(localBaseStatsTable, list);
    });
  }

  Future<List<LocalBaseStatsTableData>> getAllBaseStats() async {
    return (select(localBaseStatsTable)..where((tbl) => tbl.isDeleted.equals(false))).get();
  }

  Future<List<LocalBaseStatsTableData>> getUnsyncedRecords() async {
    return (select(localBaseStatsTable)..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  Future<void> markAsSynced(String subjectId) async {
    await (update(localBaseStatsTable)..where((tbl) => tbl.subjectId.equals(subjectId)))
        .write(const LocalBaseStatsTableCompanion(isSynced: Value(true)));
  }
}
