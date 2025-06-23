import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/utils/enums/order_status_enum.dart';

class OrderTracking extends StatelessWidget {
  final OrdersEntity ordersEntity;
  const OrderTracking({super.key, required this.ordersEntity});

  // Maps enum to index
  int getCurrentStep(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return 0;
      case OrderStatusEnum.confirmed:
        return 1;
      case OrderStatusEnum.shipped:
        return 2;
      case OrderStatusEnum.delivered:
        return 3;
      case OrderStatusEnum.cancelled:
        return -1; // Special case
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final steps = [
      context.tr(LocaleKeys.order_status_pending),
      context.tr(LocaleKeys.order_status_confirmed),
      context.tr(LocaleKeys.order_status_shipped),
      context.tr(LocaleKeys.order_status_delivered),
    ];

    final currentStep = getCurrentStep(ordersEntity.orderStatus);

    if (currentStep == -1) {
      return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            context.tr(LocaleKeys.order_has_been_cancelled),
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.order_delivery_tracking),
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(steps.length, (index) {
              final isActive = index <= currentStep;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(
                        isActive
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color:
                            isActive
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                      ),
                      if (index < steps.length - 1)
                        Container(
                          width: 2,
                          height: 30,
                          color:
                              isActive
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.2),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      steps[index],
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color:
                            isActive
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurfaceVariant,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
