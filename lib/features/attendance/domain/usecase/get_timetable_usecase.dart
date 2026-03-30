import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTimetableUsecase {
  final TimetableRepository repository;

  GetTimetableUsecase(this.repository);

  Future<Either<Failure, List<LectureEntity>>> call({
    required String branch,
    required int semester,
    required DateTime date,
  }) {
    return repository.getTimetable(
      branch: branch,
      semester: semester,
      date: date,
    );
  }
}
