import 'package:flutter/material.dart';

import '../../../../core/theme/app_font.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
    required this.statusColor,
    required this.status,
  });

  final Color statusColor;
  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: theme.textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: statusColor,
          fontFamily: appFont(context),
        ),
      ),
    );
  }
}
