import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class TimetableRepository {
  Future<Either<Failure, List<LectureEntity>>> getTimetable({
    required String branch,
    required int semester,
    required DateTime date,
  });
}
