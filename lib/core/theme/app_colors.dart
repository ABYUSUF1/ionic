import 'package:flutter/material.dart';

abstract final class AppColors {
  // Scaffold Colors
  static const lightScaffoldBackground = Color(0xffEDF2FB);
  static const darkScaffoldBackground = Color(0xff171923);

  // Primary Color (Buttons, Icons, etc)
  static const primaryColor = Color(0xff478aff);

  // Surface Colors
  static const lightCardBackground = Color(0xFFFFFFFF);
  static const darkCardBackground = Color(0xff212330);

  // On Surface Colors Or BottomSheetBackground, etc.
  static const lightDialogBackground = Color(0xffF4FAFF);
  static const darkDialogBackground = Color(0xff303343);

  // Text Colors
  static hardTextColor(Brightness brightness) =>
      brightness == Brightness.light ? lightHardColor : darkHardColor;

  static softTextColor(Brightness brightness) =>
      brightness == Brightness.light ? lightSoftColor : darkSoftColor;

  static const lightHardColor = Colors.black;
  static const lightSoftColor = Color(0xff94A3B8);
  static const darkHardColor = Colors.white;
  static const darkSoftColor = Color(0xff7D8096);

  // Error Color
  static const lightErrorColor = Color(0xFFEA2A33);
  static const darkErrorColor = Color(0xffF27A80);

  // Divider Color
  static const lightDividerColor = Color(0xffE2E8F0);
  static const darkDividerColor = Color(0xff2C2F41);
}
