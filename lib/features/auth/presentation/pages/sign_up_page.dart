import 'package:campus_connect/core/widgets/snackbar.dart';
import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
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
  Branch? selectedBranch;
  Year? selectedYear;
  Semester? selectedSemester;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              backgroundColor: Colors.white,
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
                                    child: _buildDropdown<Branch>(
                                      label: "Branch",
                                      value: selectedBranch,
                                      items: Branch.values,
                                      onChanged: (value) {
                                        setState(() => selectedBranch = value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: _buildDropdown<Year>(
                                      label: "Year",
                                      value: selectedYear,
                                      items: Year.values,
                                      onChanged: (value) {
                                        setState(() => selectedYear = value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: _buildDropdown<Semester>(
                                      label: "Sem",
                                      value: selectedSemester,
                                      items: Semester.values,
                                      onChanged: (value) {
                                        setState(
                                          () => selectedSemester = value,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),

                              AuthSubmitButton(
                                buttonLabel: 'Register',
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                    SignupRequested(
                                      username: usernameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      branch: selectedBranch!,
                                      year: selectedYear!,
                                      semester: selectedSemester!,
                                    ),
                                  );
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

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              hint: Text("Select"),
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.toString().split('.').last),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
