import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/entities/order_summary_entity.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../../features/cart/presentation/widgets/cart_coupon_code.dart';

class OrderSummaryWidget extends StatelessWidget {
  final OrderSummaryEntity cartOrderSummary;
  final bool showCouponCode;
  const OrderSummaryWidget({
    super.key,
    required this.cartOrderSummary,
    this.showCouponCode = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: showCouponCode ? 368 : 307,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: showCouponCode ? 16 : 0),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.cart_order_summary),
            style: theme.textTheme.headlineMedium,
          ),
          showCouponCode ? const CartCouponCode() : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.cart_subtotal),
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "EGP ${cartOrderSummary.subtotal}",
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.cart_delivery_fee),
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "EGP ${cartOrderSummary.totalFees}",
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.cart_coupon_discount),
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "- EGP ${cartOrderSummary.totalDiscountedPrice}",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.cart_total),
                style:
                    showCouponCode
                        ? theme.textTheme.headlineMedium!.copyWith(fontSize: 26)
                        : theme.textTheme.titleLarge,
              ),
              Text(
                "EGP ${cartOrderSummary.totalPrice}",
                style:
                    showCouponCode
                        ? theme.textTheme.headlineMedium!.copyWith(fontSize: 26)
                        : theme.textTheme.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
