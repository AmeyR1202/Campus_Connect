import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateAttendanceUsecase {
  final AttendanceRepository repository;

  UpdateAttendanceUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required String subjectId,
    required String lectureId,
    required AttendanceStatus status,
  }) async {
    return await repository.updateLecture(
      userId: userId,
      lectureId: lectureId,
      subjectId: subjectId,
      status: status,
    );
  }
}
