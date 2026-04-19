import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/data/datasources/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/timetable/data/models/lecture_model.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final FirestoreTimetableDatasource datasource;

  TimetableRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> addLecture({
    required String userId,
    required LectureEntity entity,
  }) async {
    final model = LectureModel(
      lectureId: entity.lectureId,

      subjectName: entity.subjectName,
      day: entity.day,
      startTime: entity.startTime,
      endTime: entity.endTime,
      type: entity.type,
    );
    try {
      await datasource.addLecture(userId, entity.lectureId, model.toMap());
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLecture({
    required String userId,
    required String lectureId,
  }) async {
    try {
      await datasource.deleteLecture(userId, lectureId);
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<LectureEntity>>> getLecturesForDay({
    required String userId,
    required DateTime date,
  }) async {
    try {
      final models = await datasource.getLecturesForDay(userId, date);

      final entities = models.map((m) => m.toEntity()).toList()
        ..sort((a, b) => a.startTime.compareTo(b.startTime));

      return right(entities);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<LectureEntity>>> getAllLectures({
    required String userId,
  }) async {
    try {
      final models = await datasource.getAllLectures(userId);

      final entities = models.map((m) => m.toEntity()).toList()
        ..sort((a, b) => a.startTime.compareTo(b.startTime));

      return right(entities);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required LectureEntity entity,
  }) async {
    try {
      final model = LectureModel(
        lectureId: entity.lectureId,
        subjectName: entity.subjectName,
        day: entity.day,
        startTime: entity.startTime,
        endTime: entity.endTime,
        type: entity.type,
      );
      await datasource.updateLecture(userId, entity.lectureId, model.toMap());
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
