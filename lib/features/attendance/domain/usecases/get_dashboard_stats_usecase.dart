import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';

class _SubjectAccumulator {
  int baseAttended = 0;
  int baseMissed = 0;
  int trackedTotal = 0;
  int trackedAttended = 0;
}

class GetDashboardStatsUsecase {
  List<SubjectStats> call({
    required List<AttendanceEntity> attendanceList,
    required List<SubjectBaseStatsEntity> baseStatsList,
    List<String>? timetableSubjects,
  }) {
    final Map<String, _SubjectAccumulator> grouped = {};

    if (timetableSubjects != null) {
      for (final subject in timetableSubjects) {
        grouped[subject] = _SubjectAccumulator();
      }
    }

    // 2. Loop over base stats EXACTLY once.
    for (final base in baseStatsList) {
      final acc = grouped.putIfAbsent(
        base.subjectId,
        () => _SubjectAccumulator(),
      );
      acc.baseAttended = base.attended;
      acc.baseMissed = base.missed;
    }

    // 3. Loop over the attendance logs EXACTLY once.
    for (final att in attendanceList) {
      final acc = grouped.putIfAbsent(
        att.subjectId,
        () => _SubjectAccumulator(),
      );
      if (att.status == AttendanceStatus.present) {
        acc.trackedAttended++;
        acc.trackedTotal++;
      } else if (att.status == AttendanceStatus.absent) {
        acc.trackedTotal++;
      }
      // If cancelled, do nothing.
    }

    // 4. Calculate final percentages using our accumulator!
    final List<SubjectStats> statsList = [];

    grouped.forEach((subjectId, acc) {
      final total = acc.trackedTotal + acc.baseAttended + acc.baseMissed;
      final attended = acc.trackedAttended + acc.baseAttended;

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

    return statsList;
  }
}
