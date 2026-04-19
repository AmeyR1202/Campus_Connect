import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SheetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool enabled;
  const SheetTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      cursorColor: AppThemeHelper.colors.primary,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: AppThemeHelper.colors.textSecondary,
          size: 20,
        ),
        filled: true,
        fillColor: enabled
            ? AppThemeHelper.colors.info.withValues(alpha: 0.1)
            : AppThemeHelper.colors.info.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
