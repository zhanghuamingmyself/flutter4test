// theme/text_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter4test/theme/theme_constants.dart';

class AppTextTheme {
  static TextTheme get lightTextTheme => TextTheme(
    displayLarge: const TextStyle(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
      letterSpacing: -0.25,
    ),
    displayMedium: const TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightOnSurface.withOpacity(0.6),
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOnSurface,
      letterSpacing: 0.5,
    ),
  );

  static TextTheme get darkTextTheme => TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface.withOpacity(0.7),
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkOnSurface,
      letterSpacing: 0.5,
    ),
  );
}