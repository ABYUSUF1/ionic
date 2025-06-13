import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_order_summary.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_payment_method.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../widgets/checkout_address_button.dart';
import '../widgets/checkout_delivery_instructions.dart';
import '../widgets/checkout_shipping_items.dart';

class CheckoutMobileViewBody extends StatelessWidget {
  const CheckoutMobileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartOrderSummary = context.read<CartCubit>().state.whenOrNull(
      success: (p, s) => s,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        spacing: 30,
        children: [
          const CheckoutAddressButton(),
          const CheckoutDeliveryInstructions(),
          const CheckoutShippingItems(),
          const CheckoutPaymentMethod(),
          OrderSummary(
            cartOrderSummary: cartOrderSummary!,
            showCouponCode: false,
          ),
        ],
      ),
    );
  }
}
