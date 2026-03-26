import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String subjectName;
  final double percentage;
  final String statusText;
  final Color statusColor;

  const SubjectCard({
    super.key,
    required this.subjectName,
    required this.percentage,
    required this.statusText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subjectName,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Must Attend: 3',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: statusColor),
                  ),

                  SizedBox(
                    height: 16,
                    child: VerticalDivider(
                      color: AppThemeHelper.colors.border,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    'Can Bunk: 3',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: statusColor),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            "${percentage.toStringAsFixed(0)}%",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
