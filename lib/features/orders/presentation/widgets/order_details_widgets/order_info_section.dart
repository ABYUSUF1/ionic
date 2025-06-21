import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

class OrderInfoSection extends StatelessWidget {
  final OrdersEntity ordersEntity;
  const OrderInfoSection({super.key, required this.ordersEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedDate = DateFormat(
      'yyyy/MM/dd - hh:mm a',
    ).format(ordersEntity.placedAt);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      tileColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order ID: ", style: theme.textTheme.bodyMedium),
          Expanded(
            child: Text(
              ordersEntity.orderId,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(
        "Created At: $formattedDate",
        style: theme.textTheme.bodySmall,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.copy, size: 18),
        tooltip: "Copy Order ID",
        style: IconButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: ordersEntity.orderId));
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Order ID copied!")));
        },
      ),
    );
  }
}
