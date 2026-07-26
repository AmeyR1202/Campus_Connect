import 'package:campus_connect/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_remote_datasource.dart';

class SyncProfileDataUsecase {
  final ProfileLocalDatasource localDatasource;
  final ProfileRemoteDatasource remoteDatasource;

  SyncProfileDataUsecase({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  Future<void> call({required String userId}) async {
    // 1. PUSH: Get unsynced local profile updates and push to Firestore
    final unsyncedProfiles = await localDatasource.getUnsyncedProfiles();

    for (var profile in unsyncedProfiles) {
      try {
        await remoteDatasource.updateUsername(
          userId: profile.userId,
          newUserName: profile.username,
        );
        // Mark as synced locally
        await localDatasource.markAsSynced(profile.userId);
      } catch (e) {
        // Skip on fail
      }
    }
  }
}
