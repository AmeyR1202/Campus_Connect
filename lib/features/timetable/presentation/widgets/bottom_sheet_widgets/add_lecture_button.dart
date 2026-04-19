import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AddLectureButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddLectureButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeHelper.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
        ),
        child: Text(
          "Add Lecture",
          style: AppTheme.light.textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppThemeHelper.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
