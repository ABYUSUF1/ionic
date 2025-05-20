import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Color? color;
  final String? svgIcon;
  final IconData? icon;
  final void Function()? onPressed;

  const CustomOutlineButton({
    super.key,
    required this.text,
    this.svgIcon,
    this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
        minimumSize: const Size(double.infinity, 55),
      ),
      label: Text(
        text,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon:
          svgIcon == null
              ? icon == null
                  ? null
                  : Icon(icon, color: color, size: 24)
              : SvgPicture.asset(svgIcon!, width: 24, height: 24),
    );
  }
}
