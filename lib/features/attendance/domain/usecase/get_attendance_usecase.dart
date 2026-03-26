import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAttendanceUsecase {
  final AttendanceRepository repository;

  GetAttendanceUsecase(this.repository);

  Future<Either<Failure, List<AttendanceEntity>>> call({
    required String userId,
    required String subjectId,
  }) {
    return repository.getAttendance(userId: userId, subjectId: subjectId);
  }
}
