import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          const SizedBox(height: 16),

          const Text(
            "Start tracking your attendance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          Text(
            "Mark your lectures to see detailed attendance stats.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppThemeHelper.colors.textSecondary),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              context.push('/manage-timetable');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppThemeHelper.colors.primary,
            ),
            child: Text(
              "Create Timetable",
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
