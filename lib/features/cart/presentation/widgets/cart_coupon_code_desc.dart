import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_font.dart';

import '../../../../generated/locale_keys.g.dart';

class CartCouponCodeDesc extends StatelessWidget {
  const CartCouponCodeDesc({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = isDark ? Colors.greenAccent : Colors.green;
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      margin: isMobile ? const EdgeInsets.symmetric(horizontal: 16) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color.withValues(alpha: 0.2),
        border: Border.all(color: color, width: 1.0),
      ),
      child: Text(
        context.tr(LocaleKeys.cart_delivery_fee_desc),
        style: theme.textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontFamily: appFont(context),
        ),
      ),
    );
  }
}
