import 'dart:async';
import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({super.key});

  @override
  State<ForgetPasswordBottomSheet> createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  final TextEditingController controller = TextEditingController();

  String? validationError;
  String? localError;
  Timer? errorTimer;

  @override
  void dispose() {
    controller.dispose();
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
        if (state is AuthError) {
          _showError(state.message);
        }
        if (state is PasswordResetEmailSent) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email sent successfully')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/forget_password.svg'),
                  const SizedBox(height: 10),
                  Text(
                    "Forget Password",
                    style: AppTheme.light.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter your email, we will send you verification code",
                    style: AppTheme.light.textTheme.labelSmall!.copyWith(
                      color: AppThemeHelper.colors.muted,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  AuthInputField(
                    hintText: "Enter your Email Id",
                    controller: controller,
                    errorText: validationError,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  AuthSubmitButton(
                    buttonLabel: 'Submit',
                    isLoading: isLoading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final email = controller.text.trim();
                      final bool isValidEmail = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(email);

                      setState(() {
                        validationError = email.isEmpty
                            ? 'Email field cannot be empty'
                            : (!isValidEmail
                                  ? 'Enter a valid email address'
                                  : null);
                      });

                      if (validationError != null) {
                        return;
                      }
                      context.read<AuthBloc>().add(
                        ForgetPasswordRequested(email: email),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
