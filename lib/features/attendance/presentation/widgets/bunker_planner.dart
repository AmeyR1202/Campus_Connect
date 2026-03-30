import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:flutter/material.dart';

class BunkPlannerCard extends StatelessWidget {
  final List<SubjectStats> safeSubjects;
  final List<SubjectStats> dangerSubjects;

  const BunkPlannerCard({
    super.key,
    required this.safeSubjects,
    required this.dangerSubjects,
  });

  @override
  Widget build(BuildContext context) {
    if (safeSubjects.isEmpty && dangerSubjects.isEmpty) return const SizedBox.shrink();

    final textTheme = Theme.of(context).textTheme;

    final totalCanBunk = safeSubjects.fold(0, (sum, s) => sum + s.canBunk);
    final totalMustAttend = dangerSubjects.fold(
      0,
      (sum, s) => sum + s.mustAttend,
    );

    final isAllSafe = dangerSubjects.isEmpty;
    final isAllDanger = safeSubjects.isEmpty;

    final colors = AppThemeHelper.colors;

    final Color baseColor = isAllSafe
        ? colors.success
        : (isAllDanger ? colors.error : colors.warning);

    final Color bgColor = baseColor.withValues(alpha: 0.12);
    final Color textColor = colors.textTertiary;

    int bigNumber = 0;
    String bigLabel = "";
    String insightText = "";

    if (isAllSafe) {
      bigNumber = totalCanBunk;
      bigLabel = "bunks available";
      insightText = "You're safe across all ${safeSubjects.length} subjects!";
    } else if (isAllDanger) {
      bigNumber = totalMustAttend;
      bigLabel = "classes to attend";
      insightText =
          "All ${dangerSubjects.length} subjects are in the danger zone.";
    } else {
      bigNumber = totalMustAttend;
      bigLabel = "classes to attend";
      insightText =
          "You have $totalCanBunk bunks elsewhere, but fix your ${dangerSubjects.length} danger subjects first.";
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: baseColor.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "$bigNumber",
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: baseColor,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bigLabel,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            insightText,
            style: textTheme.labelSmall?.copyWith(color: textColor),
          ),

          if (safeSubjects.isNotEmpty || dangerSubjects.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(height: 1, color: baseColor.withValues(alpha: 0.2)),
            const SizedBox(height: 12),
            ...[...dangerSubjects, ...safeSubjects].map((stat) {
              final isSafe = stat.percentage >= 75;

              final statColor = isSafe ? colors.success : colors.error;

              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Icon(
                      isSafe
                          ? Icons.check_circle_outline
                          : Icons.warning_amber_rounded,
                      color: statColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        stat.subjectId.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ),
                    Text(
                      isSafe
                          ? "Can Bunk: ${stat.canBunk}"
                          : "Must Attend: ${stat.mustAttend}",
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: statColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}
