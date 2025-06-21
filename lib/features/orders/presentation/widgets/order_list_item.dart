import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_font.dart';

class OrderListItem extends StatelessWidget {
  final String orderId;
  final int itemCount;
  final String date;
  final String total;
  final String status;
  final Color statusColor;

  const OrderListItem({
    super.key,
    required this.orderId,
    required this.itemCount,
    required this.date,
    required this.total,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        minVerticalPadding: 0,
        dense: true,
        title: Text(
          orderId,
          style: theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: appFont(context),
          ),
        ),
        subtitle: Text(
          "$itemCount items • $date",
          style: theme.textTheme.bodyMedium,
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
              color: statusColor,
              fontFamily: appFont(context),
            ),
          ),
        ),
      ),
    );
  }
}
