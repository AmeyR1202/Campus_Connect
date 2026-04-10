import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateLectureUsecase {
  final TimetableRepository repository;

  UpdateLectureUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required LectureEntity entity,
  }) {
    return repository.updateLecture(userId: userId, entity: entity);
  }
}
