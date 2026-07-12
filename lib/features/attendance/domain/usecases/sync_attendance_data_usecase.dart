import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class SyncAttendanceDataUsecase {
  final AttendanceRepository repository;

  SyncAttendanceDataUsecase(this.repository);

  Future<Either<Failure, void>> call({required String userId}) async {
    return await repository.syncData(userId: userId);
  }
}
