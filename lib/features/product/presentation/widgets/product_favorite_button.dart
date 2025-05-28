import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/widgets/responsive_layout.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveLayout.isMobile(context);
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: isMobile ? colorScheme.secondary : colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(IconsaxPlusLinear.heart, color: colorScheme.onSurfaceVariant),
    );
  }
}
