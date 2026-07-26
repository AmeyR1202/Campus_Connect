import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class SetBaseStatsUsecase {
  final AttendanceRepository repository;

  SetBaseStatsUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required SubjectBaseStatsEntity entity,
  }) async {
    return await repository.setBaseStats(userId: userId, entity: entity);
  }
}
