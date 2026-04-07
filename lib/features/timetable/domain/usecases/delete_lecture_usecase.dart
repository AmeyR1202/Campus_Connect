import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteLectureUsecase {
  final TimeTableRepository repository;

  DeleteLectureUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String uid,
    required String lectureId,
  }) {
    return repository.deleteLecture(uid: uid, lectureId: lectureId);
  }
}
