import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/theme/theme_variants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightColors.background,
    colorScheme: ColorScheme.light(
      primary: lightColors.primary,
      surface: lightColors.surface,
    ),
    fontFamily: 'DMSans',

    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColors.surface,
      foregroundColor: lightColors.textPrimary,
      elevation: 0,
      surfaceTintColor:
          AppThemeHelper.colors.surface, // white only in scrolling
    ),
    cardTheme: CardThemeData(
      color: lightColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: lightColors.border),
      ),
    ),
  );
}
