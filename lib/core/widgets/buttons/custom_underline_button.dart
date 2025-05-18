import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_colors.dart';

class CustomUnderlineButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomUnderlineButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(
            bottom: 3, // Space between underline and text
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.primaryColor,
                width: 1.0, // Underline thickness
              ),
            ),
          ),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
