import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/tables/local_profile_table.dart';
import 'package:drift/drift.dart';

part 'profile_dao.g.dart';

@DriftAccessor(tables: [LocalProfileTable])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(super.db);

  // Upsert Profile
  Future<void> upsertProfile(LocalProfileTableCompanion profile) async {
    await into(localProfileTable).insertOnConflictUpdate(profile);
  }

  // Get Profile by userId
  Future<LocalProfileTableData?> getProfile(String userId) async {
    return await (select(
      localProfileTable,
    )..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();
  }

  // 3. Get unsynced profiles
  Future<List<LocalProfileTableData>> getUnsyncedProfiles() async {
    return await (select(
      localProfileTable,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  // 4. Mark as Synced
  Future<void> markAsSynced(String userId) async {
    await (update(localProfileTable)..where((tbl) => tbl.userId.equals(userId)))
        .write(const LocalProfileTableCompanion(isSynced: Value(true)));
  }
}
