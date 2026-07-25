import 'package:campus_connect/core/database/app_database.dart';

abstract interface class ProfileLocalDatasource {
  Future<void> upsertProfile(LocalProfileTableCompanion profile);
  Future<LocalProfileTableData?> getProfile({required String userId});
  Future<List<LocalProfileTableData>> getUnsyncedProfiles();
  Future<void> markAsSynced(String userId);
}
