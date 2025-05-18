import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/widgets/loading/normal_loading.dart';

import '../../theme/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final IconData? icon;
  final String? svgIcon;
  const CustomFilledButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.buttonColor,
    this.textStyle,
    this.icon,
    this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: isLoading ? null : onPressed,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor:
            isLoading
                ? theme.colorScheme.secondary
                : buttonColor ?? AppColors.primaryColor,
        foregroundColor: textStyle?.color ?? Colors.white,
        minimumSize: const Size(double.infinity, 55),
      ),
      label:
          isLoading
              ? NormalLoading(color: Colors.white)
              : Text(
                text,
                style:
                    textStyle ??
                    theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),

      icon:
          icon == null
              ? svgIcon == null
                  ? null
                  : SvgPicture.asset(svgIcon!, width: 24, height: 24)
              : Icon(icon),
    );
  }
}
