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

  final Color trueBlack;
  final Color trueWhite;
  final Color themeGreen;
  final Color themeOrange;
  final Color textDark1A;
  final Color textBlack54;
  final Color textBlack87;

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
    required this.trueBlack,
    required this.trueWhite,
    required this.themeGreen,
    required this.themeOrange,
    required this.textDark1A,
    required this.textBlack54,
    required this.textBlack87,
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
    Color? trueBlack,
    Color? trueWhite,
    Color? themeGreen,
    Color? themeOrange,
    Color? textDark1A,
    Color? textBlack54,
    Color? textBlack87,
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
      trueBlack: trueBlack ?? this.trueBlack,
      trueWhite: trueWhite ?? this.trueWhite,
      themeGreen: themeGreen ?? this.themeGreen,
      themeOrange: themeOrange ?? this.themeOrange,
      textDark1A: textDark1A ?? this.textDark1A,
      textBlack54: textBlack54 ?? this.textBlack54,
      textBlack87: textBlack87 ?? this.textBlack87,
    );
  }
}
