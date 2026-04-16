import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:campus_connect/features/auth/presentation/widgets/forget_password_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  final String userEmail;
  const LoginPage({super.key, required this.userEmail});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final emailController = TextEditingController(text: widget.userEmail);
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.go('/home');
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(body: Center(child: Loader()));
        }

        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),

                          Text(
                            "Log in to your\nAccount",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineLarge!.copyWith(fontSize: 34),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Enter your email and password to log in",
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: AppThemeHelper.colors.textSecondary,
                                ),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          const SizedBox(height: 8),

                          AuthInputField(
                            hintText: 'example@gmail.com',
                            controller: emailController,
                          ),
                          SizedBox(height: 20),

                          Text.rich(
                            TextSpan(
                              text: 'Password ',
                              style: Theme.of(context).textTheme.bodyMedium,

                              children: [
                                TextSpan(
                                  text: '(at least 6 characters)',
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color:
                                            AppThemeHelper.colors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),

                          AuthInputField(
                            hintText: "Enter your password",
                            autofocus:
                                true, // by default enabled as email field is auto entered
                            isObscure: obscurePassword,
                            controller: passwordController,
                            onToggle: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),

                          const SizedBox(height: 12),

                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  useRootNavigator: true,
                                  builder: (context) =>
                                      ForgetPasswordBottomSheet(),
                                );
                              },
                              child: Text(
                                "Forgot Password ?",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: AppThemeHelper.colors.primary,
                                    ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          AuthSubmitButton(
                            buttonLabel: 'Log In',
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                LoginRequested(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 30),

                          InkWell(
                            onTap: () {
                              context.go('/signup');
                            },
                            child: AuthSwitchText(
                              questionText: 'Don\'t have an account? ',
                              actionText: 'Register',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
