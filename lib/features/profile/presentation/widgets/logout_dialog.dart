import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Logout'),
      content: Text(
        'Are you sure you want to logout?',
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
            context.read<SessionCubit>().logout();
            context.go('/welcome');
          },
          child: Text(
            'Logout',
            style: TextStyle(
              color: AppThemeHelper.colors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
