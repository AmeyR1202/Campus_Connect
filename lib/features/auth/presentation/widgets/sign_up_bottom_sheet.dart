import 'dart:async';

import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:campus_connect/features/auth/presentation/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBottomSheet extends StatefulWidget {
  final VoidCallback? onLoginTapped;

  const SignUpBottomSheet({super.key, this.onLoginTapped});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  String? localError;
  Timer? errorTimer;

  String? usernameError;
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    usernameController.dispose();
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

  void _onSignup() {
    FocusScope.of(context).unfocus();
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final bool isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

    setState(() {
      usernameError = username.isEmpty ? "Username is required" : null;
      emailError = email.isEmpty
          ? "Email is required"
          : (!isValidEmail ? "Enter a valid email address" : null);
      passwordError = password.length < 6
          ? "Password must be at least 6 characters"
          : null;
    });

    if (usernameError != null || emailError != null || passwordError != null) {
      return;
    }

    context.read<AuthBloc>().add(
      SignupRequested(username: username, email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthVerificationEmailSent) {
          context.go('/email-success', extra: emailController.text.trim());
        }
        if (state is AuthError) {
          _showError(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppThemeHelper.colors.trueWhite,
                  borderRadius: const BorderRadius.only(
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
                        "Create your account",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(fontSize: 34),
                      ),

                      const SizedBox(height: 30),

                      if (localError != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppThemeHelper.colors.themeRed.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppThemeHelper.colors.themeRed
                                    .withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: AppThemeHelper.colors.themeRed,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    localError!,
                                    style: TextStyle(
                                      color: AppThemeHelper.colors.themeRed,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      Text(
                        "What should we call you?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),

                      AuthInputField(
                        hintText: 'e.g., Alex',
                        controller: usernameController,
                        errorText: usernameError,
                        textCapitalization: TextCapitalization.words,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            RegExp(r'\s'),
                          ), // Deny spaces
                        ],
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),

                      AuthInputField(
                        hintText: 'example@gmail.com',
                        controller: emailController,
                        errorText: emailError,
                        keyboardType: TextInputType.emailAddress,
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
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      AuthInputField(
                        hintText: "Enter your password",
                        isObscure: obscurePassword,
                        controller: passwordController,
                        errorText: passwordError,
                        onToggle: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      const SizedBox(height: 10),

                      const SizedBox(height: 30),

                      AuthSubmitButton(
                        buttonLabel: 'Register',
                        onPressed: () {
                          _onSignup();
                        },
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: InkWell(
                          onTap: () {
                            if (widget.onLoginTapped != null) {
                              widget.onLoginTapped!();
                            } else {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor:
                                    AppThemeHelper.colors.trueTransparent,
                                builder: (context) => const LoginBottomSheet(),
                              );
                            }
                          },
                          child: const AuthSwitchText(
                            questionText: 'Already have an account? ',
                            actionText: 'Log in',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    child: const Center(child: Loader()),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
