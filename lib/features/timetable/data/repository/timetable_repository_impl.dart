import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/data/datasources/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/timetable/data/datasources/local_timetable_datasource.dart';
import 'package:campus_connect/features/timetable/data/models/lecture_model.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final FirestoreTimetableDatasource datasource;
  final LocalTimetableDatasource localTimetableDatasource;

  TimetableRepositoryImpl({
    required this.datasource,
    required this.localTimetableDatasource,
  });

  @override
  Future<Either<Failure, void>> addLecture({
    required String userId,
    required LectureEntity entity,
  }) async {
    final model = LectureModel.fromEntity(entity);

    try {
      // 1. Save locally first (marked as unsynced)
      await localTimetableDatasource.cacheLecture(
        model.toCompanion(isSynced: false),
      );

      // 2. Try to push to remote
      try {
        await datasource.addLecture(userId, entity.lectureId, model.toMap());
        // 3. If remote succeeds, mark local as synced
        await localTimetableDatasource.markAsSynced(entity.lectureId);
      } catch (e) {
        // Fail silently on remote push. It will sync later in background
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLecture({
    required String userId,
    required String lectureId,
  }) async {
    try {
      // Soft delete locally
      await localTimetableDatasource.markAsDeleted(lectureId);

      // Try to push delete to remote
      try {
        await datasource.deleteLecture(userId, lectureId);
        // If remote delete succeeds, hard delete locally
        await localTimetableDatasource.hardDeleteLecture(lectureId);
      } catch (e) {
        // Fail silently. It will be hard deleted on next sync
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LectureEntity>>> getLecturesForDay({
    required String userId,
    required DateTime date,
  }) async {
    try {
      // Get the day name (e.g., 'Mon', 'Tue' etc) based on the date
      // Wait, the local db expects the exact string like "Monday" or whatever format was used.
      // We will fetch all and filter, or just use the local query if we know the string format.
      // Assuming 'day' is a standard string stored in DB

      // We need the day name. But the user passes date. Let's just fetch all and filter, or let the bloc pass the correct day name.
      // Actually, the previous implementation did:
      // final dayName = DateFormat('EEE').format(date); (in Firestore datasource)
      // We will do the same here if needed, but the abstract method already passes `date`.
      // Let's implement it with dart core.
      const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      final dayName = weekdays[date.weekday - 1]; // Simple formatting for 'EEE'

      // 1. Fetch only from local DB
      final localLectures = await localTimetableDatasource.getLecturesForDay(
        dayName,
      );

      // 2. Map to Entities
      final entities =
          localLectures
              .map((e) => LectureModel.fromLocalData(e).toEntity())
              .toList()
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LectureEntity>>> getAllLectures({
    required String userId,
  }) async {
    try {
      // Fetch only from local DB
      final localLectures = await localTimetableDatasource.getAllLectures();

      //  Map to Entities
      final entities =
          localLectures
              .map((e) => LectureModel.fromLocalData(e).toEntity())
              .toList()
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required LectureEntity entity,
  }) async {
    try {
      final model = LectureModel.fromEntity(entity);

      // Update locally first (marked as unsynced)
      await localTimetableDatasource.updateLecture(
        entity.lectureId,
        model.toCompanion(isSynced: false),
      );

      // Try to push to remote
      try {
        await datasource.updateLecture(userId, entity.lectureId, model.toMap());
        // If remote succeeds, mark local as synced
        await localTimetableDatasource.markAsSynced(entity.lectureId);
      } catch (e) {
        // Fail silently
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncData({required String userId}) async {
    try {
      // push phase
      final unsyncedLocal = await localTimetableDatasource
          .getUnsyncedLectures();

      for (final local in unsyncedLocal) {
        if (local.isDeleted) {
          try {
            await datasource.deleteLecture(userId, local.lectureId);
            await localTimetableDatasource.hardDeleteLecture(local.lectureId);
          } catch (_) {
            /* Continue if remote delete fails */
          }
        } else {
          try {
            final model = LectureModel.fromLocalData(local);
            // using addLecture because it does a Set in Firestore (upsert)
            await datasource.addLecture(userId, local.lectureId, model.toMap());
            await localTimetableDatasource.markAsSynced(local.lectureId);
          } catch (_) {
            /* Continue if remote set fails */
          }
        }
      }

      //pull
      final remoteLectures = await datasource.getAllLectures(userId);
      final localLectures = await localTimetableDatasource.getAllLectures();

      final localMap = {for (var loc in localLectures) loc.lectureId: loc};

      for (final remote in remoteLectures) {
        final local = localMap[remote.lectureId];

        // If it doesn't exist locally, we cache it
        if (local == null) {
          await localTimetableDatasource.cacheLecture(
            remote.toCompanion(isSynced: true),
          );
        } else {
          if (local.isSynced) {
            await localTimetableDatasource.updateLecture(
              remote.lectureId,
              remote.toCompanion(isSynced: true),
            );
          }
        }
      }

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
