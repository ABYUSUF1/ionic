import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_colors.dart';

InputDecorationTheme inputDecorationTheme(bool isDarkMode) {
  return InputDecorationTheme(
    /// Borders style
    border: _outlineInputBorder(
      isDarkMode ? AppColors.darkDividerColor : AppColors.lightDividerColor,
    ),
    errorBorder: _outlineInputBorder(
      isDarkMode ? AppColors.darkErrorColor : AppColors.lightErrorColor,
    ),
    focusedBorder: _outlineInputBorder(AppColors.primaryColor, 2),
    focusedErrorBorder: _outlineInputBorder(
      isDarkMode ? AppColors.darkErrorColor : AppColors.lightErrorColor,
      2,
    ),

    /// padding style
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

    /// Text styles
    labelStyle: _inputTextStyle(isDarkMode),
    hintStyle: _inputTextStyle(isDarkMode),
    errorStyle: TextStyle(
      color: isDarkMode ? AppColors.darkErrorColor : AppColors.lightErrorColor,
    ),
  );
}

OutlineInputBorder _outlineInputBorder(Color color, [double width = 1]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: width),
  );
}

TextStyle _inputTextStyle(bool isDarkMode) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.softTextColor(
      isDarkMode ? Brightness.dark : Brightness.light,
    ),
  );
}
