import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDashboardStatsUsecase {
  final AttendanceRepository repository;

  GetDashboardStatsUsecase(this.repository);

  Future<Either<Failure, List<SubjectStats>>> call({
    required String userId,
  }) async {
    final attResult = await repository.getAllAttendance(userId: userId);
    if (attResult.isLeft()) {
      return left((attResult as Left).value);
    }

    final baseResult = await repository.getAllBaseStats(userId: userId);
    if (baseResult.isLeft()) {
      return left((baseResult as Left).value);
    }

    final attendanceList = attResult.getOrElse((l) => []);
    final baseStatsList = baseResult.getOrElse((l) => []);

    final Map<String, List<AttendanceEntity>> grouped = {};
    for (var a in attendanceList) {
      grouped.putIfAbsent(a.subjectId, () => []).add(a);
    }

    final Map<String, int> baseAttended = {};
    final Map<String, int> baseMissed = {};

    for (var b in baseStatsList) {
      baseAttended[b.subjectId] = b.attended;
      baseMissed[b.subjectId] = b.missed;
      grouped.putIfAbsent(b.subjectId, () => []);
    }

    final List<SubjectStats> statsList = [];

    grouped.forEach((subjectId, logs) {
      final validLogs = logs
          .where((l) => l.status != AttendanceStatus.cancelled)
          .toList();

      final bAttended = baseAttended[subjectId] ?? 0;
      final bMissed = baseMissed[subjectId] ?? 0;

      final trackedTotal = validLogs.length;
      final trackedAttended = validLogs
          .where((l) => l.status == AttendanceStatus.present)
          .length;

      final total = trackedTotal + bAttended + bMissed;
      final attended = trackedAttended + bAttended;

      final percentage = total == 0 ? 0.0 : (attended / total) * 100;

      const requiredPercentage = 0.75;

      int canBunk = ((attended / requiredPercentage) - total).floor();
      if (canBunk < 0) canBunk = 0;

      int mustAttend = 0;
      if (percentage < 75) {
        mustAttend =
            ((requiredPercentage * total - attended) / (1 - requiredPercentage))
                .ceil();
      }

      statsList.add(
        SubjectStats(
          subjectId: subjectId,
          percentage: percentage,
          total: total,
          attended: attended,
          canBunk: canBunk,
          mustAttend: mustAttend,
        ),
      );
    });

    return right(statsList);
  }
}
