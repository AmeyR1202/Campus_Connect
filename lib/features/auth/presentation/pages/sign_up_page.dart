import 'package:campus_connect/core/widgets/dropdown.dart';
import 'package:campus_connect/core/widgets/snackbar.dart';
import 'package:campus_connect/features/auth/domain/enums/batch.dart';
import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:campus_connect/features/auth/presentation/extensions/batch_extension.dart';
import 'package:campus_connect/features/auth/presentation/extensions/branch_extension.dart';
import 'package:campus_connect/features/auth/presentation/extensions/semester_extension.dart';
import 'package:campus_connect/features/auth/presentation/extensions/year_extension.dart';
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
  Branch? selectedBranch;
  Year? selectedYear;
  Semester? selectedSemester;
  Batch? selectedBatch;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    if (selectedBranch == null ||
        selectedYear == null ||
        selectedSemester == null ||
        selectedBatch == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select all fields")));

      return;
    }

    context.read<AuthBloc>().add(
      SignupRequested(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        branch: selectedBranch!,
        year: selectedYear!,
        semester: selectedSemester!,
        batch: selectedBatch!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthVerificationEmailSent) {
          context.go('/email-success');
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

                              const SizedBox(height: 20),

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
                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  Expanded(
                                    child: AppDropdown<Branch>(
                                      label: "Branch",
                                      getLabel: (s) => s.displayBranch,
                                      value: selectedBranch,
                                      items: Branch.values,
                                      onChanged: (value) {
                                        setState(() => selectedBranch = value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: AppDropdown<Year>(
                                      label: "Year",
                                      getLabel: (s) => s.displayYear,
                                      value: selectedYear,
                                      items: Year.values,
                                      onChanged: (value) {
                                        setState(() => selectedYear = value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: AppDropdown<Semester>(
                                      label: "Semester",
                                      getLabel: (s) => s.displayName,
                                      value: selectedSemester,
                                      items: Semester.values,
                                      onChanged: (value) {
                                        setState(
                                          () => selectedSemester = value,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: AppDropdown<Batch>(
                                      label: "Batch",
                                      getLabel: (s) => s.displayBatch,
                                      value: selectedBatch,
                                      items: Batch.values,
                                      onChanged: (value) {
                                        setState(() => selectedBatch = value);
                                      },
                                    ),
                                  ),
                                ],
                              ),

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
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
          ],
        );
      },
    );
  }
}
