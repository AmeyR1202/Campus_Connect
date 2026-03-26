import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color background;
  final Color surface;
  final Color surfaceVariant;

  final Color textPrimary;
  final Color textSecondary;

  final Color border;

  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color accent;

  final Color muted;

  final Color iconPrimary;

  final Color textTertiary;

  const AppColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.accent,
    required this.muted,
    required this.iconPrimary,
    required this.textTertiary,
  });

  AppColors copyWith({
    Color? primary,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? accent,
    Color? muted,
    Color? iconPrimary,
    Color? textTertiary,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      accent: accent ?? this.accent,
      muted: muted ?? this.muted,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      textTertiary: textTertiary ?? this.textTertiary,
    );
  }
}
