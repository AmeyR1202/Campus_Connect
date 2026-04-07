import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class TimeTableRepository {
  Future<Either<Failure, List<LectureEntity>>> getLecturesForDay({
    required String uid,
    required DateTime date,
  });

  Future<Either<Failure, void>> updateLecture({
    required String uid,
    required LectureEntity entity,
  });

  Future<Either<Failure, void>> addLecture({
    required String uid,
    required LectureEntity entity,
  });

  Future<Either<Failure, void>> deleteLecture({
    required String uid,
    required String lectureId,
  });
}
