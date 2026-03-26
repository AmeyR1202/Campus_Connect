import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, void>> upsertAttendance({
    required String userId,
    required AttendanceEntity entity,
  });

  Future<Either<Failure, List<AttendanceEntity>>> getAttendance({
    required String userId,
    required String subjectId,
  });

  Future<Either<Failure, List<AttendanceEntity>>> getAllAttendance({
    required String userId,
  });

  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required String subjectId,
    required String lectureId,
    required AttendanceStatus status,
  });
}
