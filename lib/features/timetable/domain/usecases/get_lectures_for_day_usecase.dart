import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLecturesForDayUsecase {
  final TimetableRepository repository;

  GetLecturesForDayUsecase(this.repository);

  Future<Either<Failure, List<LectureEntity>>> call({
    required String userId,
    required DateTime date,
  }) {
    return repository.getLecturesForDay(userId: userId, date: date);
  }
}
