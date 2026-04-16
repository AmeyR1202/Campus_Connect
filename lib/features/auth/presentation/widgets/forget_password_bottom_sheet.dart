import 'package:campus_connect/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({super.key});

  @override
  State<ForgetPasswordBottomSheet> createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            AuthInputField(
              hintText: "Enter your Email Id",
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
