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
      duration: const Duration(seconds: 30),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    final errorColor = Theme.of(context).colorScheme.error;
    _showCustomSnackBar(
      context: context,
      message: message,
      color: errorColor,
      duration: const Duration(minutes: 1),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: Colors.green,
      duration: const Duration(seconds: 30),
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
    content: SnackBarContent(message: message, color: color, icon: icon),
    backgroundColor: color.withValues(alpha: 0.2),
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
      duration: Duration(milliseconds: 800),
      reverseDuration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    ),
  );
}
