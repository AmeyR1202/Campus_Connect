import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AuthSwitchText extends StatelessWidget {
  final String questionText;
  final String actionText;

  const AuthSwitchText({
    super.key,
    required this.questionText,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: questionText,
          style: TextStyle(color: AppThemeHelper.colors.info, fontSize: 15),
          children: [
            TextSpan(
              text: actionText,
              style: TextStyle(
                color: const Color(0xFF2196F3),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
