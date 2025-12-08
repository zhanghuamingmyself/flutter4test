// theme/theme_constants.dart
import 'package:flutter/material.dart';

class AppColors {
  // 亮色主题颜色
  static const lightPrimary = Color(0xFF0066CC);
  static const lightPrimaryContainer = Color(0xFFD0E4FF);
  static const lightSecondary = Color(0xFF6C5CE7);
  static const lightSecondaryContainer = Color(0xFFE9E6FF);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightBackground = Color(0xFFF8F9FA);
  static const lightError = Color(0xFFD32F2F);
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF1A1A1A);
  static const lightOnBackground = Color(0xFF1A1A1A);
  static const lightOnError = Color(0xFFFFFFFF);

  // 暗色主题颜色
  static const darkPrimary = Color(0xFF9ECAFF);
  static const darkPrimaryContainer = Color(0xFF004A99);
  static const darkSecondary = Color(0xFFCBC3FF);
  static const darkSecondaryContainer = Color(0xFF5246C4);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkBackground = Color(0xFF121212);
  static const darkError = Color(0xFFCF6679);
  static const darkOnPrimary = Color(0xFF003366);
  static const darkOnSecondary = Color(0xFF1A1A1A);
  static const darkOnSurface = Color(0xFFFFFFFF);
  static const darkOnBackground = Color(0xFFFFFFFF);
  static const darkOnError = Color(0xFF000000);

  // 语义化颜色 - 适用于两种主题
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const info = Color(0xFF2196F3);

  // 中性色
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const grey800 = Color(0xFF424242);
  static const grey900 = Color(0xFF212121);
}

class AppDimens {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xlarge = 32.0;

  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  static const double appBarElevation = 0.0;
  static const double cardElevation = 2.0;
}