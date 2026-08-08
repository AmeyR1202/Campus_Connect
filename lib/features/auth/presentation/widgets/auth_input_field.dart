import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final VoidCallback? onToggle;
  final bool autofocus;
  const AuthInputField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.onToggle,
    this.autofocus = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      cursorColor: AppThemeHelper.colors.primary,
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        filled: true,
        fillColor: AppThemeHelper.colors.info.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
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
