import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllAttendanceUsecase {
  final AttendanceRepository repository;

  GetAllAttendanceUsecase(this.repository);

  Future<Either<Failure, List<AttendanceEntity>>> call({
    required String userId,
  }) async {
    return await repository.getAllAttendance(userId: userId);
  }
}
