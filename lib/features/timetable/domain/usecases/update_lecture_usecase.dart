import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateLectureUsecase {
  final TimeTableRepository repository;

  UpdateLectureUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String uid,
    required LectureEntity entity,
  }) {
    return repository.updateLecture(uid: uid, entity: entity);
  }
}
