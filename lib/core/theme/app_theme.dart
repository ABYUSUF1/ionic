import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0, // No shadow
      foregroundColor: AppColors.lightHardColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.lightCardBackground,
      onSurface: AppColors.lightHardColor,
      onSurfaceVariant: AppColors.lightSoftColor,
      outline: AppColors.lightDividerColor,
      secondary: AppColors.lightDialogBackground,
      error: AppColors.lightErrorColor,
    ),
    textTheme: AppTextStyles.appTextTheme(Brightness.light),
    inputDecorationTheme: const InputDecorationTheme(
      // Style for text fields
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightDividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      hintStyle: TextStyle(color: AppColors.lightSoftColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return null;
      }),
    ),
  );

  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.darkHardColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      surface: AppColors.darkCardBackground,
      onSurface: AppColors.darkHardColor,
      onSurfaceVariant: AppColors.darkSoftColor,
      secondary: AppColors.darkDialogBackground,
      outline: AppColors.darkDividerColor,
      error: AppColors.darkErrorColor,
    ),
    textTheme: AppTextStyles.appTextTheme(Brightness.dark),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkDividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      hintStyle: TextStyle(color: AppColors.darkSoftColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return null;
      }),
    ),
  );
}
