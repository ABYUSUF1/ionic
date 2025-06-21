import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/order_summary_widget.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_payment_method.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../widgets/checkout_address_button.dart';
import '../widgets/checkout_delivery_instructions.dart';
import '../widgets/checkout_shipping_items.dart';
import 'checkout_place_order_button.dart';

class CheckoutTabletViewBody extends StatelessWidget {
  const CheckoutTabletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartOrderSummary = context.read<CartCubit>().state.whenOrNull(
      success: (p, s) => s,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CheckoutAddressButton(),
                  CheckoutDeliveryInstructions(),
                  CheckoutShippingItems(),
                  CheckoutPaymentMethod(),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              spacing: 16,
              children: [
                OrderSummaryWidget(
                  cartOrderSummary: cartOrderSummary!,
                  showCouponCode: false,
                ),
                const CheckoutPlaceOrderButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
