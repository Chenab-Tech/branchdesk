import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryPurple,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        brightness: Brightness.light,
        surface: AppColors.lightSurface,
      ).copyWith(
        primary: AppColors.primaryPurple,
        secondary: AppColors.primaryIndigo,
        tertiary: AppColors.accentPink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.textBlack,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColors.textBlack, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: AppColors.textBlack),
        bodyMedium: TextStyle(color: AppColors.textGrayDark),
      ),
    );
  }

  // Dark Theme (Preferred 'Nano Banana' Look)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryPurple,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        brightness: Brightness.dark,
        surface: AppColors.darkSurface,
      ).copyWith(
        primary: AppColors.primaryPurple,
        secondary: AppColors.accentCyan,
        tertiary: AppColors.accentGreen,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.textWhite,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: AppColors.textWhite),
        bodyMedium: TextStyle(color: AppColors.textGrayLight),
      ),
    );
  }
}
