import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/session/session_state.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/profile/presentation/widgets/avatar_widget.dart';
import 'package:campus_connect/features/profile/presentation/widgets/change_password_dialog.dart';
import 'package:campus_connect/features/profile/presentation/widgets/edit_name_sheet.dart';
import 'package:campus_connect/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:campus_connect/features/profile/presentation/widgets/profile_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return const Center(child: Loader());
        }

        final memberSince = DateFormat('MMM yyyy').format(user.createdAt);

        return SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.padding(context)),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),

              AvatarWidget(username: user.username),
              const SizedBox(height: AppSpacing.md),
              Text(
                user.username,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 22,
                  color: AppThemeHelper.colors.textTertiary,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppThemeHelper.colors.muted,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    user.isEmailVerified
                        ? Icons.verified_rounded
                        : Icons.error_outline_rounded,
                    size: 16,
                    color: user.isEmailVerified
                        ? AppThemeHelper.colors.success
                        : AppThemeHelper.colors.warning,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.xl),

              ProfileInfoTile(
                icon: Icons.person_outline_rounded,
                label: 'Display Name',
                value: user.username,
                trailing: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppThemeHelper.colors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 16,
                    color: AppThemeHelper.colors.primary,
                  ),
                ),
                onTap: () => showEditNameSheet(context, user.username),
              ),
              const SizedBox(height: AppSpacing.sm),
              ProfileInfoTile(
                icon: Icons.email_outlined,
                label: 'Email Address',
                value: user.email,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: user.isEmailVerified
                        ? AppThemeHelper.colors.success.withValues(alpha: 0.1)
                        : AppThemeHelper.colors.warning.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    user.isEmailVerified ? 'Verified' : 'Unverified',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: user.isEmailVerified
                          ? AppThemeHelper.colors.success
                          : AppThemeHelper.colors.warning,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ProfileInfoTile(
                icon: Icons.calendar_month_outlined,
                label: 'Member Since',
                value: memberSince,
              ),

              const SizedBox(height: AppSpacing.xl),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Account',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppThemeHelper.colors.muted,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ProfileInfoTile(
                icon: Icons.lock_outline_rounded,
                label: 'Security',
                value: 'Change Password',
                onTap: () => showChangePasswordDialog(context, user.email),
              ),

              const SizedBox(height: AppSpacing.xl + AppSpacing.md),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () => showLogoutDialog(context),
                  icon: Icon(
                    Icons.logout_rounded,
                    color: AppThemeHelper.colors.error,
                    size: 20,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(
                      color: AppThemeHelper.colors.error,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppThemeHelper.colors.error.withValues(alpha: 0.4),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        );
      },
    );
  }
}
