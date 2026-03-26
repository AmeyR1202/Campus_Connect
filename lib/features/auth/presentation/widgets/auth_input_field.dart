import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final VoidCallback? onToggle;
  const AuthInputField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.onToggle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppThemeHelper.colors.primary,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppThemeHelper.colors.info.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        suffixIcon: onToggle != null
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: onToggle,
              )
            : null,
      ),
    );
  }
}
