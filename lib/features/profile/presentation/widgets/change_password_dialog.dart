import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showChangePasswordDialog(BuildContext context, String email) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Change Password'),
      content: Text(
        'We\'ll send a password reset link to\n$email',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppThemeHelper.colors.info),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: AppThemeHelper.colors.muted),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<SessionCubit>().sendPasswordReset(email);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Password reset email sent!'),
                backgroundColor: AppThemeHelper.colors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          child: Text(
            'Send Link',
            style: TextStyle(
              color: AppThemeHelper.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
