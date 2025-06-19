import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../manager/cubit/checkout_cubit.dart';

class CheckoutPlaceOrderButton extends StatelessWidget {
  const CheckoutPlaceOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cartState = context.watch<CartCubit>().state;
    final checkoutState = context.watch<CheckoutCubit>().state;

    final totalPrice = cartState.maybeWhen(
      success: (_, summary) => summary.totalPrice,
      orElse: () => 0.0,
    );

    final totalQuantity = cartState.maybeWhen(
      success: (_, summary) => summary.totalQuantity,
      orElse: () => 0,
    );

    final canPlaceOrder = checkoutState.canPlaceOrder;

    return ResponsiveLayout.isMobile(context)
        ? ColoredBox(
          color: theme.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                button(context, canPlaceOrder, theme, totalPrice.toInt()),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${context.tr(LocaleKeys.cart_total)}: $totalPrice EGP",
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      context.plural(
                        LocaleKeys.cart_items_in_cart,
                        totalQuantity,
                        args: [totalQuantity.toString()],
                      ),
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        : button(context, canPlaceOrder, theme, totalPrice.toInt());
  }

  CustomFilledButton button(
    BuildContext context,
    bool canPlaceOrder,
    ThemeData theme,
    int amount,
  ) {
    bool isLoading = context.read<CheckoutCubit>().state.isLoading;

    return CustomFilledButton(
      text: context.tr(LocaleKeys.checkout_place_order),
      isLoading: isLoading,
      buttonColor:
          canPlaceOrder ? AppColors.primaryColor : theme.colorScheme.secondary,
      onPressed:
          canPlaceOrder
              ? () {
                context.read<CheckoutCubit>().placeOrder(context, amount);
              }
              : null,
    );
  }
}
