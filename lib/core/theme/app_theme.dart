import 'package:flutter/material.dart';
import 'package:ionic/core/theme/widgets_theme/snackbar_theme.dart';
import 'package:ionic/core/theme/widgets_theme/text_field_theme.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0, // No shadow
      foregroundColor: AppColors.lightHardColor,
      scrolledUnderElevation: 0,
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
    textTheme: AppTextStyles.appTextTheme(Brightness.light, context),
    inputDecorationTheme: inputDecorationTheme(false),
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
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDividerColor,
      thickness: 2,
    ),
    snackBarTheme: snackBarThemeData,
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
  );

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.darkHardColor,
      scrolledUnderElevation: 0,
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
    textTheme: AppTextStyles.appTextTheme(Brightness.dark, context),
    inputDecorationTheme: inputDecorationTheme(true),

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
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDividerColor,
      thickness: 2,
    ),
    snackBarTheme: snackBarThemeData,
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
  );
}
