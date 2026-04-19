import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class TimetableRepository {
  Future<Either<Failure, List<LectureEntity>>> getLecturesForDay({
    required String userId,
    required DateTime date,
  });

  Future<Either<Failure, List<LectureEntity>>> getAllLectures({
    required String userId,
  });

  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required LectureEntity entity,
  });

  Future<Either<Failure, void>> addLecture({
    required String userId,
    required LectureEntity entity,
  });

  Future<Either<Failure, void>> deleteLecture({
    required String userId,
    required String lectureId,
  });
}
