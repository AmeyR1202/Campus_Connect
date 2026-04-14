import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/core/widgets/snackbar.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

        return Stack(
          children: [
            Scaffold(
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
                                "Sign in to your\nAccount",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 34),
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

                              const SizedBox(height: 10),

                              Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),

                              AuthInputField(
                                hintText: 'example@gmail.com',
                                controller: emailController,
                              ),

                              const SizedBox(height: 10),

                              Text.rich(
                                TextSpan(
                                  text: 'Password ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: '(at least 6 characters)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
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
                              const SizedBox(height: 10),

                              const SizedBox(height: 30),

                              AuthSubmitButton(
                                buttonLabel: 'Register',
                                onPressed: () {
                                  _onSignup();
                                },
                              ),

                              const SizedBox(height: 30),

                              InkWell(
                                onTap: () {
                                  context.go('/login');
                                },
                                child: AuthSwitchText(
                                  questionText: 'Already have an account? ',
                                  actionText: 'Log in',
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
            ),

            if (isLoading)
              Container(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                child: const Center(child: Loader()),
              ),
          ],
        );
      },
    );
  }
}
