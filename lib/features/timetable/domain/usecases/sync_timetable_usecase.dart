import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';

class SyncTimetableUsecase {
  final TimetableRepository repository;

  SyncTimetableUsecase(this.repository);

  Future<Either<Failure, void>> call({required String userId}) {
    return repository.syncData(userId: userId);
  }
}
