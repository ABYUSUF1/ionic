import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_items_list.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../cart/presentation/manager/cubit/cart_cubit.dart';

class CheckoutShippingItems extends StatelessWidget {
  const CheckoutShippingItems({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = context.read<CartCubit>().totalQuantity;
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${context.tr(LocaleKeys.checkout_shipment)} (${context.plural(LocaleKeys.cart_items_in_cart, quantity, args: [quantity.toString()])})",
            style: theme.textTheme.headlineMedium!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${context.tr(LocaleKeys.delivery_arrives_by)} ",
                  style: theme.textTheme.bodyMedium,
                ),
                TextSpan(
                  text: "Wed, Jun 18",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 30),
          const CheckoutItemsList(),
        ],
      ),
    );
  }
}
