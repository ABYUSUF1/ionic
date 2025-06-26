import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/theme/app_colors.dart';

final class AppSnackbar {
  static void showNoteSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: AppColors.primaryColor,
      icon: IconsaxPlusLinear.information,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: Colors.red.shade600,
      icon: IconsaxPlusLinear.danger,
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context: context,
      message: message,
      color: Colors.green.shade600,
      icon: IconsaxPlusLinear.tick_square,
    );
  }
}

void _showCustomSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
  IconData? icon,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.removeCurrentSnackBar();

  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    duration: const Duration(seconds: 3),
    padding: EdgeInsets.zero,
    content: Material(
      borderRadius: BorderRadius.circular(12),
      color: color,
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsetsDirectional.only(start: 16),
        leading:
            icon != null ? Icon(icon, color: Colors.white, size: 28) : null,
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => messenger.hideCurrentSnackBar(),
        ),
      ),
    ),
  );

  // Show the new snackbar. It will animate in.
  messenger.showSnackBar(snackBar);
}
