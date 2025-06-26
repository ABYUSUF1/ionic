import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../generated/locale_keys.g.dart';

class CouponActionButton extends StatelessWidget {
  final bool isApplied;
  final bool isLoading;
  final VoidCallback onPressed;

  const CouponActionButton({
    super.key,
    required this.isApplied,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomFilledButton(
      isLoading: isLoading,
      buttonColor:
          isApplied ? theme.colorScheme.error : theme.colorScheme.primary,
      text: context.tr(
        isApplied
            ? LocaleKeys.cart_remove_coupon
            : LocaleKeys.cart_apply_coupon,
      ),
      onPressed: onPressed,
    );
  }
}
