import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetStatsUsecase {
  final AttendanceRepository repository;
  GetStatsUsecase(this.repository);
  Future<Either<Failure, StatsEntity>> call({
    required String userId,
    required String subjectId,
  }) {
    return repository.getStats(userId: userId, subjectId: subjectId);
  }
}
