import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../manager/cubit/cart_cubit.dart';
import 'coupon_action_button.dart';
import 'coupon_text_field.dart';

class CartCouponCode extends StatefulWidget {
  const CartCouponCode({super.key});

  @override
  State<CartCouponCode> createState() => _CartCouponCodeState();
}

class _CartCouponCodeState extends State<CartCouponCode> {
  late final TextEditingController controller;
  bool isProcessing = false;

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

  bool _isValidCode(String code) =>
      code.isNotEmpty && RegExp(r'^[A-Z0-9]{4}$').hasMatch(code);

  Future<void> _showSnack({required bool success, required String key}) async {
    final ctx = context;
    if (success) {
      AppSnackbar.showSuccessSnackBar(ctx, ctx.tr(key));
    } else {
      AppSnackbar.showErrorSnackBar(ctx, ctx.tr(key));
    }
  }

  Future<void> _handleCouponAction() async {
    if (isProcessing) return;
    setState(() => isProcessing = true);

    final cubit = context.read<CartCubit>();
    final code = controller.text.trim().toUpperCase();
    final isApplied = cubit.appliedCoupon != null;

    if (isApplied) {
      await cubit.removeCoupon();
      controller.clear();
      if (!mounted) return;
      AppSnackbar.showNoteSnackBar(
        context,
        context.tr(LocaleKeys.cart_coupon_removed),
      );
    } else if (_isValidCode(code)) {
      final success = await cubit.applyCoupon(code);
      await _showSnack(
        success: success,
        key:
            success
                ? LocaleKeys.cart_coupon_applied
                : LocaleKeys.cart_invalid_coupon,
      );
      if (success) FocusManager.instance.primaryFocus?.unfocus();
    } else {
      await _showSnack(success: false, key: LocaleKeys.cart_invalid_coupon);
    }

    setState(() => isProcessing = false);
  }

  @override
  Widget build(BuildContext context) {
    final isApplied = context.watch<CartCubit>().appliedCoupon != null;

    return Row(
      children: [
        Expanded(
          child: CouponTextField(controller: controller, readOnly: isApplied),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 100,
          child: CouponActionButton(
            isApplied: isApplied,
            isLoading: isProcessing,
            onPressed: _handleCouponAction,
          ),
        ),
      ],
    );
  }
}
