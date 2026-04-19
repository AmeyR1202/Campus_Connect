import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatelessWidget {
  final String label;
  final TimeOfDay? time;
  final VoidCallback onTap;
  const TimePickerWidget({
    super.key,

    required this.label,
    this.time,
    required this.onTap,
  });

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select';

    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppThemeHelper.colors.info.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 20,
                  color: AppThemeHelper.colors.textSecondary,
                ),
                const SizedBox(width: 10),
                Text(
                  time != null ? _formatTime(time) : 'Select',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: time != null
                        ? AppThemeHelper.colors.textTertiary
                        : AppThemeHelper.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
