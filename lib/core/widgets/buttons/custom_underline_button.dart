import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_colors.dart';

class CustomUnderlineButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  const CustomUnderlineButton({
    super.key,
    this.onPressed,
    this.textStyle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 3, // Space between underline and text
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: textStyle?.color ?? AppColors.primaryColor,
                width: 1.0, // Underline thickness
              ),
            ),
          ),
          child: Text(
            text,
            style:
                textStyle ??
                theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
