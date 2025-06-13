import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../manager/cubit/cart_cubit.dart';

class CartCouponCode extends StatefulWidget {
  const CartCouponCode({super.key});

  @override
  State<CartCouponCode> createState() => _CartCouponCodeState();
}

class _CartCouponCodeState extends State<CartCouponCode> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: context.read<CartCubit>().appliedCoupon,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<CartCubit>();
    final isCouponApplied = cubit.appliedCoupon != null;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 55,
            child: TextField(
              controller: controller,
              readOnly: isCouponApplied,
              onTapOutside:
                  (event) => FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: context.tr(LocaleKeys.cart_coupon_code),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 100,
          child: CustomFilledButton(
            buttonColor:
                isCouponApplied
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
            text:
                isCouponApplied
                    ? context.tr(LocaleKeys.cart_remove_coupon)
                    : context.tr(LocaleKeys.cart_apply_coupon),
            onPressed: () {
              if (isCouponApplied) {
                // ✅ Remove logic
                cubit.removeCoupon();
                controller.clear();
                AppSnackbar.showNoteSnackBar(
                  context,
                  context.tr(LocaleKeys.cart_coupon_removed),
                );
              } else {
                // ✅ Apply logic
                final code = controller.text.trim();
                if (code.length == 4) {
                  cubit.applyCoupon(code);
                  AppSnackbar.showSuccessSnackBar(
                    context,
                    context.tr(LocaleKeys.cart_coupon_applied),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                } else {
                  AppSnackbar.showErrorSnackBar(
                    context,
                    context.tr(LocaleKeys.cart_invalid_coupon),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
