import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../manager/cubit/checkout_cubit.dart';
import 'package:ionic/core/constants/app_assets.dart';

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

    return ResponsiveLayout.isMobile(context)
        ? ColoredBox(
          color: theme.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAction(context, checkoutState, theme, totalPrice.toInt()),
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
                        LocaleKeys.common_items_count,
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
        : _buildAction(context, checkoutState, theme, totalPrice.toInt());
  }

  Widget _buildAction(
    BuildContext context,
    CheckoutState state,
    ThemeData theme,
    int amount,
  ) {
    final isLoading = state.isLoading;
    final reason = state.canPlaceOrderReason;
    final canPlaceOrder = state.canPlaceOrder;

    if (!canPlaceOrder && reason != null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(IconsaxPlusLinear.info_circle, color: Colors.orange),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                reason,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return CustomFilledButton(
      text: context.tr(LocaleKeys.checkout_place_order),
      isLoading: isLoading,
      buttonColor: AppColors.primaryColor,
      onPressed: () async {
        final isAuthenticatedWithPhone = context
            .read<AuthCubit>()
            .state
            .maybeWhen(
              authenticated: (authEntity) => authEntity.phoneNumber != null,
              orElse: () => false,
            );

        if (!isAuthenticatedWithPhone) {
          showCustomDialog(
            context: context,
            title: context.tr(LocaleKeys.checkout_error_no_phone_title),
            subTitle: context.tr(LocaleKeys.checkout_error_no_phone_desc),
            svgPic: AppAssets.illustrationsLoginIllustrationDark,
            buttonText: context.tr(LocaleKeys.checkout_error_add_phone_button),
            onTap: () {
              context.pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileView()),
              );
            },
          );
          return;
        }

        await context.read<CheckoutCubit>().placeOrder(context, amount);
      },
    );
  }
}
