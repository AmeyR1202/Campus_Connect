import 'dart:async';

import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:campus_connect/features/auth/presentation/widgets/forget_password_bottom_sheet.dart';
import 'package:campus_connect/features/auth/presentation/widgets/sign_up_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBottomSheet extends StatefulWidget {
  final String userEmail;
  final VoidCallback? onRegisterTapped;

  const LoginBottomSheet({
    super.key,
    this.userEmail = '',
    this.onRegisterTapped,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  late final emailController = TextEditingController(text: widget.userEmail);
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  String? localError;
  Timer? errorTimer;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    errorTimer?.cancel();
    super.dispose();
  }

  void _showError(String message) {
    setState(() {
      localError = message;
    });
    errorTimer?.cancel();
    errorTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          localError = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.go('/home');
        }

        if (state is AuthError) {
          _showError(state.message);
        }

        if (state is PasswordResetEmailSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email sent successfully')),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log in to your\nAccount",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(fontSize: 34),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Enter your email and password to log in",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppThemeHelper.colors.muted,
                    ),
                  ),
                  const SizedBox(height: 30),

                  if (localError != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                localError!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  Text("Email", style: Theme.of(context).textTheme.bodyMedium),

                  const SizedBox(height: 8),

                  AuthInputField(
                    hintText: 'example@gmail.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),

                  Text.rich(
                    TextSpan(
                      text: 'Password ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '(at least 6 characters)',
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: AppThemeHelper.colors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  AuthInputField(
                    hintText: "Enter your password",
                    isObscure: obscurePassword,
                    controller: passwordController,
                    onToggle: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          useRootNavigator: true,
                          builder: (context) =>
                              const ForgetPasswordBottomSheet(),
                        );
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppThemeHelper.colors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  AuthSubmitButton(
                    buttonLabel: 'Continue',
                    isLoading: state is AuthLoading,
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        _showError(
                          'Please ensure all fields are filled correctly.',
                        );
                        return;
                      }
                      context.read<AuthBloc>().add(
                        LoginRequested(email: email, password: password),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: InkWell(
                      onTap: () {
                        if (widget.onRegisterTapped != null) {
                          widget.onRegisterTapped!();
                        } else {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const SignUpBottomSheet(),
                          );
                        }
                      },
                      child: const AuthSwitchText(
                        questionText: 'Don\'t have an account? ',
                        actionText: 'Register',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
