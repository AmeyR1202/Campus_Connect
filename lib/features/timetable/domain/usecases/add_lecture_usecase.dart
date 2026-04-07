import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddLectureUsecase {
  final TimeTableRepository repository;

  AddLectureUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String uid,
    required LectureEntity entity,
  }) {
    return repository.addLecture(uid: uid, entity: entity);
  }
}
