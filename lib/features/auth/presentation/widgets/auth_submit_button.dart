import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;
  const AuthSubmitButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeHelper.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 18,
            color: AppThemeHelper.colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
