import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddAttendanceUsecase {
  final AttendanceRepository repository;

  AddAttendanceUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required AttendanceEntity entity,
  }) {
    return repository.upsertAttendance(userId: userId, entity: entity);
  }
}
