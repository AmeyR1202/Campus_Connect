import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllLecturesUsecase {
  final TimetableRepository repository;

  GetAllLecturesUsecase(this.repository);

  Future<Either<Failure, List<LectureEntity>>> call({
    required String userId,
  }) {
    return repository.getAllLectures(userId: userId);
  }
}
