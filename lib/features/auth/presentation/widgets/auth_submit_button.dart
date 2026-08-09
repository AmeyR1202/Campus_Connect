import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final bool isLoading;

  const AuthSubmitButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppThemeHelper.colors.textDark1A,
          side: BorderSide(color: AppThemeHelper.colors.black12, width: 1.5),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppThemeHelper.colors.textDark1A,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppThemeHelper.colors.trueBlack.withValues(alpha: 0.35),
            spreadRadius: 4,
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeHelper.colors.textDark1A,
          foregroundColor: AppThemeHelper.colors.trueWhite,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppThemeHelper.colors.trueWhite,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
