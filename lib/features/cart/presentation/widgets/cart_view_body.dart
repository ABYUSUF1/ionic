import 'package:flutter/material.dart';
import 'package:ionic/core/entities/order_summary_entity.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_list.dart';

import 'cart_coupon_code_desc.dart';
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth > 900;

    if (isTablet) {
      // Tablet layout
      return Row(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: CartList(cartEntity: cartEntity),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const CartCouponCodeDesc(),
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
          const CartCouponCodeDesc(),
          OrderSummaryWidget(cartOrderSummary: cartOrderSummary),
        ],
      ),
    );
  }
}
