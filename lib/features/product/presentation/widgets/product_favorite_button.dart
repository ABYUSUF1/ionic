import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(IconsaxPlusLinear.heart, color: colorScheme.onSurfaceVariant),
    );
  }
}
