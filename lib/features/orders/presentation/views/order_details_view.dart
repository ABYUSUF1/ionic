import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/presentation/widgets/order_details_widgets/order_delivery_address.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../widgets/order_details_widgets/order_info_section.dart';
import '../widgets/order_details_widgets/order_tracking.dart';

class OrderDetailsView extends StatelessWidget {
  final OrdersEntity ordersEntity;
  const OrderDetailsView({super.key, required this.ordersEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.order_details)),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OrderInfoSection(ordersEntity: ordersEntity),
            OrderTracking(ordersEntity: ordersEntity),
            OrderDeliveryAddress(orderEntity: ordersEntity),
          ],
        ),
      ),
    );
  }
}
