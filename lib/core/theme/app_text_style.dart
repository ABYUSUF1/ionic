import 'package:flutter/material.dart';

import 'app_colors.dart';

final class AppTextStyles {
  static TextTheme appTextTheme(Brightness brightness) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontFamily: 'Pulp Display',
        color: AppColors.hardTextColor(brightness),
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontFamily: 'Pulp Display',
        color: AppColors.hardTextColor(brightness),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.hardTextColor(brightness),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColors.hardTextColor(brightness),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.hardTextColor(brightness),
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.softTextColor(brightness),
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.softTextColor(brightness),
      ),
      // Add other text styles as needed
    );
  }
}
