import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class CheckoutSuccessView extends StatelessWidget {
  const CheckoutSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.goNamed(AppRouterName.homeRoute);
        }
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: FadeInDown(
          from: 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomIn(
                  curve: Curves.easeOutBack,
                  child: Icon(
                    IconsaxPlusBold.tick_circle,
                    size: 100,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  context.tr(LocaleKeys.checkout_thank_you_for_ordering),
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr(LocaleKeys.checkout_order_placed_successfully),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  spacing: 16,
                  children: [
                    CustomOutlineButton(
                      text: context.tr(LocaleKeys.checkout_view_order),
                      onPressed:
                          () => context.pushNamed(AppRouterName.ordersRoute),
                    ),
                    CustomFilledButton(
                      text: context.tr(LocaleKeys.checkout_continue_shopping),
                      onPressed: () => context.go(AppRouterName.homeRoute),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
