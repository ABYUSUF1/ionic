import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/cart/domain/entity/cart_order_summary.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../manager/cubit/cart_cubit.dart';

class CartBottomBar extends StatelessWidget {
  final CartOrderSummary cartOrderSummary;
  const CartBottomBar({super.key, required this.cartOrderSummary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<CartCubit>();
    final width = MediaQuery.sizeOf(context).width;
    return cubit.state.isLoading
        ? const SizedBox.shrink()
        : ColoredBox(
          color: theme.colorScheme.surface,
          child: GestureDetector(
            onTap: () {
              context.push(AppRouterName.checkoutRoute);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin:
                  width > 900
                      ? const EdgeInsets.all(16)
                      : const EdgeInsets.only(
                        right: 16,
                        left: 16,
                        bottom: 8,
                        top: 16,
                      ),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.colorScheme.primary,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.plural(
                          LocaleKeys.cart_items_in_cart,
                          cubit.cartEntityList.length,
                          args: [cubit.cartEntityList.length.toString()],
                        ),
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ZoomIn(
                        curve: Curves.easeInOutBack,
                        key: ValueKey(cartOrderSummary.totalPrice),
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          "EGP ${cartOrderSummary.totalPrice}",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Center(
                    child: Text(
                      context.tr(LocaleKeys.cart_checkout),
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
