import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/daos/profile_dao.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_local_datasource.dart';

class LocalProfileDatasourceImpl implements ProfileLocalDatasource {
  final ProfileDao dao;

  LocalProfileDatasourceImpl({required this.dao});

  @override
  Future<void> upsertProfile(LocalProfileTableCompanion profile) async {
    await dao.upsertProfile(profile);
  }

  @override
  Future<LocalProfileTableData?> getProfile({required String userId}) async {
    return await dao.getProfile(userId);
  }

  @override
  Future<List<LocalProfileTableData>> getUnsyncedProfiles() async {
    return await dao.getUnsyncedProfiles();
  }

  @override
  Future<void> markAsSynced(String userId) async {
    await dao.markAsSynced(userId);
  }
}
