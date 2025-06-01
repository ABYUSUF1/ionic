import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/snackbar/snack_bar_content.dart';

final class AppSnackbar {
  static void showNoteSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: AppColors.primaryColor,
      duration: const Duration(seconds: 10),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: Colors.red,
      duration: const Duration(minutes: 1),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: Colors.green,
      duration: const Duration(seconds: 10),
      icon: IconsaxPlusLinear.tick_square,
    );
  }
}

void _showCustomSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
  required Duration duration,
  IconData? icon,
}) {
  final messenger = ScaffoldMessenger.of(context);

  final snackBar = SnackBar(
    content: SnackBarContent(message: message, color: Colors.white, icon: icon),
    backgroundColor: color,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    elevation: 0,
    showCloseIcon: false,
  );

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    snackBar,
    snackBarAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    ),
  );
}
