import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String username;
  const AvatarWidget({super.key, required this.username});

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppThemeHelper.colors.primary,
            AppThemeHelper.colors.primary.withValues(alpha: 0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppThemeHelper.colors.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          _getInitials(username),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppThemeHelper.colors.textPrimary,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
