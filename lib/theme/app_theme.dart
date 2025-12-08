// theme/app_theme.dart
import 'package:flutter/material.dart';
import 'theme_constants.dart';
import 'text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // 颜色方案
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.lightOnPrimary,
      primaryContainer: AppColors.lightPrimaryContainer,
      onPrimaryContainer: AppColors.lightOnSurface,

      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
      secondaryContainer: AppColors.lightSecondaryContainer,
      onSecondaryContainer: AppColors.lightOnSurface,

      surface: AppColors.lightSurface,
      onSurface: AppColors.lightOnSurface,
      surfaceVariant: AppColors.grey100,
      onSurfaceVariant: AppColors.grey700,

      background: AppColors.lightBackground,
      onBackground: AppColors.lightOnBackground,

      error: AppColors.lightError,
      onError: AppColors.lightOnError,

      outline: AppColors.grey300,
      outlineVariant: AppColors.grey200,
    ),

    // 文字主题
    textTheme: AppTextTheme.lightTextTheme,

    // 组件主题
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightOnSurface,
      elevation: AppDimens.appBarElevation,
      surfaceTintColor: Colors.transparent,
    ),

    // cardTheme: CardTheme(
    //   color: AppColors.lightSurface,
    //   surfaceTintColor: Colors.transparent,
    //   elevation: AppDimens.cardElevation,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
    //   ),
    // ),
    //
    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.lightSurface,
    //   surfaceTintColor: Colors.transparent,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
    //   ),
    // ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide(
          color: AppColors.lightPrimary,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide(
          color: AppColors.lightError,
          width: 1.0,
        ),
      ),
    ),

    // 其他组件定制
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightOnPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.medium,
          vertical: AppDimens.small,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        ),
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      indicatorColor: AppColors.lightPrimaryContainer,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTextTheme.lightTextTheme.labelSmall!.copyWith(
            color: AppColors.lightPrimary,
          );
        }
        return AppTextTheme.lightTextTheme.labelSmall!.copyWith(
          color: AppColors.grey600,
        );
      }),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // 颜色方案
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      primaryContainer: AppColors.darkPrimaryContainer,
      onPrimaryContainer: AppColors.darkOnSurface,

      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      secondaryContainer: AppColors.darkSecondaryContainer,
      onSecondaryContainer: AppColors.darkOnSurface,

      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      surfaceVariant: AppColors.grey800,
      onSurfaceVariant: AppColors.grey300,

      background: AppColors.darkBackground,
      onBackground: AppColors.darkOnBackground,

      error: AppColors.darkError,
      onError: AppColors.darkOnError,

      outline: AppColors.grey600,
      outlineVariant: AppColors.grey700,
    ),

    // 文字主题
    textTheme: AppTextTheme.darkTextTheme,

    // 组件主题
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkOnSurface,
      elevation: AppDimens.appBarElevation,
      surfaceTintColor: Colors.transparent,
    ),

    // cardTheme: CardTheme(
    //   color: AppColors.darkSurface,
    //   surfaceTintColor: Colors.transparent,
    //   elevation: AppDimens.cardElevation,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
    //   ),
    // ),
    //
    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.darkSurface,
    //   surfaceTintColor: Colors.transparent,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
    //   ),
    // ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey800,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide(
          color: AppColors.darkPrimary,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        borderSide: BorderSide(
          color: AppColors.darkError,
          width: 1.0,
        ),
      ),
    ),

    // 其他组件定制
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkOnPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.medium,
          vertical: AppDimens.small,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        ),
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      indicatorColor: AppColors.darkPrimaryContainer,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTextTheme.darkTextTheme.labelSmall!.copyWith(
            color: AppColors.darkPrimary,
          );
        }
        return AppTextTheme.darkTextTheme.labelSmall!.copyWith(
          color: AppColors.grey400,
        );
      }),
    ),
  );
}