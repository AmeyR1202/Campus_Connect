import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteLectureUsecase {
  final TimetableRepository repository;

  DeleteLectureUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required String lectureId,
  }) {
    return repository.deleteLecture(userId: userId, lectureId: lectureId);
  }
}
