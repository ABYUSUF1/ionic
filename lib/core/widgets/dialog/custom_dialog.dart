import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String svgPic,
  required String buttonText,
  required VoidCallback onTap,
}) {
  return showDialog(
    context: context,

    builder: (context) {
      final theme = Theme.of(context);
      return Dialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 16,
              bottom: 16,
              top: 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ZoomIn(
                  duration: const Duration(milliseconds: 500),
                  child: SvgPicture.asset(svgPic, width: 150, height: 150),
                ),
                const SizedBox(height: 50),
                Text(title, style: theme.textTheme.headlineMedium),
                const SizedBox(height: 5),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: CustomFilledButton(
                        text: buttonText,
                        onPressed: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
