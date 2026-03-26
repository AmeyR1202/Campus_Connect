import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppThemeHelper.colors.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.trending_up,
            size: 50,
            color: AppThemeHelper.colors.primary,
          ),
          SizedBox(height: 16),

          Text(
            "Start tracking your attendance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 8),

          Text(
            "Mark your lectures to see detailed attendance stats.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppThemeHelper.colors.textSecondary),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              context.go('/attendance');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppThemeHelper.colors.primary,
            ),
            child: Text(
              "Go to Attendance",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppThemeHelper.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
