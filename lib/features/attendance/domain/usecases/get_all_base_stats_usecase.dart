import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBaseStatsUsecase {
  final AttendanceRepository repository;

  GetAllBaseStatsUsecase(this.repository);

  Future<Either<Failure, List<SubjectBaseStatsEntity>>> call({
    required String userId,
  }) async {
    return await repository.getAllBaseStats(userId: userId);
  }
}
