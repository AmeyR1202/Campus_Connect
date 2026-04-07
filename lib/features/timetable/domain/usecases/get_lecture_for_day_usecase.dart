import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLectureForDayUsecase {
  final TimeTableRepository repository;
  GetLectureForDayUsecase(this.repository);

  Future<Either<Failure, List<LectureEntity>>> call({
    required String uid,
    required DateTime date,
  }) {
    return repository.getLecturesForDay(uid: uid, date: date);
  }
}
