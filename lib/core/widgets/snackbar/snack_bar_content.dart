import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SnackBarContent extends StatelessWidget {
  final String message;
  final Color color;
  final IconData? icon;

  const SnackBarContent({
    super.key,
    required this.message,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon ?? IconsaxPlusLinear.warning_2, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: Icon(IconsaxPlusLinear.close_circle, color: color),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    );
  }
}
