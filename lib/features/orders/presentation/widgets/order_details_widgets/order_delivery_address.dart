import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

class OrderDeliveryAddress extends StatelessWidget {
  final OrdersEntity orderEntity;
  const OrderDeliveryAddress({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customer = orderEntity.customerInfoEntity;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Address", style: theme.textTheme.headlineMedium),
          const SizedBox(height: 5),
          _customInfo(theme, IconsaxPlusLinear.profile_tick, customer.fullName),
          _customInfo(theme, IconsaxPlusLinear.location, customer.address),
          _customInfo(theme, IconsaxPlusLinear.call, customer.phoneNumber),
        ],
      ),
    );
  }

  Row _customInfo(ThemeData theme, IconData icon, String content) {
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(content, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
