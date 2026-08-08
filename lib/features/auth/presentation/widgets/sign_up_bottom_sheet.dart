import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/core/widgets/snackbar.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:campus_connect/features/auth/presentation/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty) {
      snackbar(context, "Username and Email cannot be empty");
      return;
    }
    if (password.length < 6) {
      snackbar(context, "Password must be at least 6 characters long");
      return;
    }
    context.read<AuthBloc>().add(
      SignupRequested(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
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
          snackbar(context, state.message);
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
                        "Create your account",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(fontSize: 34),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        "Username",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),

                      AuthInputField(
                        hintText: 'John Doe',
                        controller: usernameController,
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
                                backgroundColor: Colors.transparent,
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
