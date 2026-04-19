import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
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
            const SizedBox(height: 10),
            AuthInputField(
              hintText: "Enter your Email Id",
              controller: controller,
            ),
            const SizedBox(height: 15),
            AuthSubmitButton(
              buttonLabel: 'Submit',
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                final email = controller.text.trim();

                if (email.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email field cannot be empty'),
                    ),
                  );
                  return;
                }
                context.read<AuthBloc>().add(
                  ForgetPasswordRequested(email: email),
                );
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
