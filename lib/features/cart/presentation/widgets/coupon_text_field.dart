import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';

class CouponTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;

  const CouponTextField({
    super.key,
    required this.controller,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.secondary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: context.tr(LocaleKeys.cart_coupon_code),
        ),
      ),
    );
  }
}
