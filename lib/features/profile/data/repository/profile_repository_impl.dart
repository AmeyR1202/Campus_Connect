import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:campus_connect/features/profile/domain/repository/profile_repository.dart';
import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDatasource localDatasource;
  final ProfileRemoteDatasource remoteDatasource;

  ProfileRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, void>> updateUsername({
    required String userId,
    required String newUserName,
  }) async {
    try {
      // 1. SAVE LOCALLY FIRST (Offline First)
      await localDatasource.upsertProfile(
        LocalProfileTableCompanion(
          userId: Value(userId),
          username: Value(newUserName),
          isSynced: const Value(false),
        ),
      );

      // 2. ATTEMPT TO PUSH TO REMOTE
      try {
        await remoteDatasource
            .updateUsername(userId: userId, newUserName: newUserName)
            .timeout(const Duration(seconds: 2));

        // If successful, mark as synced
        await localDatasource.markAsSynced(userId);
      } catch (e) {
        // Silent fail for remote (timeout/offline), Workmanager will pick it up later
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
