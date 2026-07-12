import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/datasource/local_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:campus_connect/features/attendance/data/models/subject_base_stats_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final FirestoreAttendanceDatasource remoteAttendanceDatasource;
  final LocalAttendanceDatasource localAttendanceDatasource;

  AttendanceRepositoryImpl({
    required this.remoteAttendanceDatasource,
    required this.localAttendanceDatasource,
  });

  @override
  Future<Either<Failure, void>> upsertAttendance({
    required String userId,
    required AttendanceEntity entity,
  }) async {
    try {
      final model = AttendanceModel.fromEntity(entity);
      // 1. Save locally first (marked as unsynced)
      await localAttendanceDatasource.upsertAttendance(
        LocalAttendanceTableCompanion(
          lectureId: Value(model.lectureId),
          subjectId: Value(model.subjectId),
          status: Value(model.status),
          markedAt: Value(model.markedAt),
          isSynced: const Value(false),
        ),
      );

      // 2. TRY TO PUSH TO REMOTE
      try {
        await remoteAttendanceDatasource.upsertAttendance(
          userId: userId,
          model: model,
        );
        // 3. If remote succeeds, mark local as synced
        await localAttendanceDatasource.markAsSynced(model.lectureId);
      } catch (e) {
        // Fail silently on remote push. It will sync later in background
      }
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AttendanceEntity>>> getAttendance({
    required String userId,
    required String subjectId,
  }) async {
    try {
      // 1. Fetch only from local DB
      final localData = await localAttendanceDatasource.getAttendance(
        subjectId,
      );

      // 2. Map Drift data to Domain entity
      final entities = localData.map((data) {
        return AttendanceEntity(
          lectureId: data.lectureId,
          subjectId: data.subjectId,
          status: AttendanceStatus.values.firstWhere(
            (e) => e.name == data.status,
          ),
          markedAt: data.markedAt,
        );
      }).toList();

      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AttendanceEntity>>> getAllAttendance({
    required String userId,
  }) async {
    try {
      // 1. Map all records from local DB
      final localData = await localAttendanceDatasource.getAllAttendance();

      // 2. Map Drift data to Domain Entities
      final entities = localData.map((data) {
        return AttendanceEntity(
          lectureId: data.lectureId,
          subjectId: data.subjectId,
          status: AttendanceStatus.values.firstWhere(
            (e) => e.name == data.status,
          ),
          markedAt: data.markedAt,
        );
      }).toList();
      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required String lectureId,
    required String subjectId,
    required AttendanceStatus status,
  }) async {
    // For Offline-first, updating is just the same as upserting locally

    try {
      final entity = AttendanceEntity(
        lectureId: lectureId,
        subjectId: subjectId,
        status: status,
        markedAt: DateTime.now(),
      );
      return await upsertAttendance(userId: userId, entity: entity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  // --------- BACKGROUND SYNC ENGINE --------- //
  @override
  Future<Either<Failure, void>> syncData({required String userId}) async {
    try {
      // 1. PUSH PHASE
      final unsyncedLocal = await localAttendanceDatasource
          .getUnsyncedLectures();
      for (final local in unsyncedLocal) {
        if (!local.isDeleted) {
          try {
            final model = AttendanceModel(
              lectureId: local.lectureId,
              subjectId: local.subjectId,
              status: local.status,
              markedAt: local.markedAt,
            );
            await remoteAttendanceDatasource.upsertAttendance(
              userId: userId,
              model: model,
            );
            await localAttendanceDatasource.markAsSynced(local.lectureId);
          } catch (_) {
            // Continue if remote set fails
          }
        }
      }
      // 2. PULL PHASE (Attendance)
      final remoteResult = await remoteAttendanceDatasource.getAllAttendance(
        userId: userId,
      );

      await remoteResult.fold(
        (failure) {}, // Do nothing on pull fail
        (remoteLectures) async {
          final companions = remoteLectures
              .map(
                (remote) => LocalAttendanceTableCompanion(
                  lectureId: Value(remote.lectureId),
                  subjectId: Value(remote.subjectId),
                  status: Value(remote.status),
                  markedAt: Value(remote.markedAt),
                  isSynced: const Value(true),
                ),
              )
              .toList();
          await localAttendanceDatasource.cacheAttendance(companions);
        },
      );

      // 3. PUSH PHASE (Base Stats)
      final unsyncedStats = await localAttendanceDatasource.getUnsyncedBaseStats();
      for (final local in unsyncedStats) {
        if (!local.isDeleted) {
          try {
            final model = SubjectBaseStatsModel(
              subjectId: local.subjectId,
              attended: local.attended,
              missed: local.missed,
              cancelled: local.cancelled,
            );
            await remoteAttendanceDatasource.setBaseStats(
              userId: userId,
              model: model,
            );
            await localAttendanceDatasource.markBaseStatsAsSynced(local.subjectId);
          } catch (_) {}
        }
      }

      // 4. PULL PHASE (Base Stats)
      final remoteStatsResult = await remoteAttendanceDatasource.getAllBaseStats(userId: userId);
      await remoteStatsResult.fold(
        (failure) {},
        (remoteStats) async {
          final companions = remoteStats.map(
            (remote) => LocalBaseStatsTableCompanion(
              subjectId: Value(remote.subjectId),
              attended: Value(remote.attended),
              missed: Value(remote.missed),
              cancelled: Value(remote.cancelled),
              isSynced: const Value(true),
            )
          ).toList();
          await localAttendanceDatasource.cacheBaseStats(companions);
        }
      );
      
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubjectBaseStatsEntity>>> getAllBaseStats({
    required String userId,
  }) async {
    try {
      final localData = await localAttendanceDatasource.getAllBaseStats();
      final entities = localData.map((data) {
        return SubjectBaseStatsEntity(
          subjectId: data.subjectId,
          attended: data.attended,
          missed: data.missed,
          cancelled: data.cancelled,
        );
      }).toList();
      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setBaseStats({
    required String userId,
    required SubjectBaseStatsEntity entity,
  }) async {
    try {
      // 1. SAVE LOCALLY
      final companion = LocalBaseStatsTableCompanion(
        subjectId: Value(entity.subjectId),
        attended: Value(entity.attended),
        missed: Value(entity.missed),
        cancelled: Value(entity.cancelled),
        isSynced: const Value(false),
      );
      await localAttendanceDatasource.upsertBaseStats(companion);

      // 2. TRY TO PUSH TO REMOTE
      try {
        final model = SubjectBaseStatsModel.fromEntity(entity);
        await remoteAttendanceDatasource.setBaseStats(
          userId: userId,
          model: model,
        );
        await localAttendanceDatasource.markBaseStatsAsSynced(entity.subjectId);
      } catch (e) {
        // Fail silently
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
