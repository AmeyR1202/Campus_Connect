import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SessionTypeChip extends StatelessWidget {
  final String type;
  const SessionTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    Color chipColor;
    switch (type.toLowerCase()) {
      case 'lab':
        chipColor = AppThemeHelper.colors.warning;
      case 'tutorial':
        chipColor = AppThemeHelper.colors.accent;
      default:
        chipColor = AppThemeHelper.colors.success;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: chipColor,
        ),
      ),
    );
  }
}
