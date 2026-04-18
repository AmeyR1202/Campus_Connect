import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AttendanceStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const AttendanceStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppSpacing.radius(context)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.scale(context, 12),
          vertical: AppSpacing.scale(context, 8),
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radius(context)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.1),
              radius: AppSpacing.scale(context, 18),
              child: Icon(
                icon,
                color: color,
                size: AppSpacing.scale(context, 20),
              ),
            ),
            SizedBox(width: AppSpacing.scale(context, 8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: AppSpacing.scale(context, 11),
                      color: AppThemeHelper.colors.muted,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: AppSpacing.scale(context, 2)),
                  Text(
                    value,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: AppSpacing.scale(context, 16),
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
