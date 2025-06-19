import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/cart/domain/entity/cart_order_summary.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'cart_coupon_code.dart';

class OrderSummary extends StatelessWidget {
  final CartOrderSummary cartOrderSummary;
  final bool showCouponCode;
  const OrderSummary({
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
                "EGP ${cartOrderSummary.shippingFee}",
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
                "- EGP ${cartOrderSummary.couponDiscount}",
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
                        ? theme.textTheme.headlineLarge
                        : theme.textTheme.titleLarge,
              ),
              Text(
                "EGP ${cartOrderSummary.totalPrice}",
                style:
                    showCouponCode
                        ? theme.textTheme.headlineLarge
                        : theme.textTheme.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
