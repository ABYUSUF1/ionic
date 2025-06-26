import 'package:flutter/material.dart';
import 'package:ionic/core/entities/order_summary_entity.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_list.dart';

import 'cart_free_delivery_note.dart';
import '../../../../core/widgets/order_summary_widget.dart';

class CartViewBody extends StatelessWidget {
  final CartEntity cartEntity;
  final OrderSummaryEntity cartOrderSummary;

  const CartViewBody({
    super.key,
    required this.cartEntity,
    required this.cartOrderSummary,
  });

  @override
  Widget build(BuildContext context) {
    if (!ResponsiveLayout.isMobile(context)) {
      // Tablet layout
      return Row(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: CartList(cartEntity: cartEntity),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const CartFreeDeliveryNote(),
                  OrderSummaryWidget(cartOrderSummary: cartOrderSummary),
                  CartBottomBar(cartOrderSummary: cartOrderSummary),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Mobile layout
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartList(cartEntity: cartEntity),
          const CartFreeDeliveryNote(),
          OrderSummaryWidget(cartOrderSummary: cartOrderSummary),
        ],
      ),
    );
  }
}
