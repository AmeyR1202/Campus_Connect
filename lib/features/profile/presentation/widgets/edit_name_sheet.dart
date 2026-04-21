import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:campus_connect/features/profile/presentation/bloc/profile_event.dart';
import 'package:campus_connect/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showEditNameSheet(BuildContext context, String currentName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppThemeHelper.colors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<SessionCubit>(),
      child: EditNameSheet(currentName: currentName),
    ),
  );
}

class EditNameSheet extends StatefulWidget {
  final String currentName;
  const EditNameSheet({super.key, required this.currentName});

  @override
  State<EditNameSheet> createState() => _EditNameSheetState();
}

class _EditNameSheetState extends State<EditNameSheet> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final newName = _controller.text.trim();
    if (newName == widget.currentName) {
      Navigator.pop(context);
      return;
    }

    final user = context.read<SessionCubit>().state.user;
    if (user == null) return;

    context.read<ProfileBloc>().add(
      UpdateUsernameEvent(userId: user.id, newUserName: newName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          final newName = _controller.text.trim();
          context.read<SessionCubit>().updateUsername(newName);

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Name updated successfully'),
              backgroundColor: AppThemeHelper.colors.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        } else if (state is ProfileError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Failed to update name'),
              backgroundColor: AppThemeHelper.colors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppThemeHelper.colors.muted.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Edit Display Name',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'This is how you appear across the app',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppThemeHelper.colors.muted,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _controller,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: AppThemeHelper.colors.textTertiary.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    filled: true,
                    fillColor: AppThemeHelper.colors.info.withValues(
                      alpha: 0.1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name cannot be empty';
                    }
                    if (value.trim().length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    final isLoading = state is ProfileLoading;
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _onSave,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeHelper.colors.primary,
                          foregroundColor: AppThemeHelper.colors.textPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: isLoading
                            ? const Loader()
                            : const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
