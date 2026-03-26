import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:flutter/material.dart';

class LectureStatsChip extends StatelessWidget {
  final SubjectStats s;
  final String label;
  final String value;
  const LectureStatsChip({
    super.key,
    required this.s,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppThemeHelper.colors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: AppThemeHelper.colors.success,
            ),
          ),
        ],
      ),
    );
  }
}
