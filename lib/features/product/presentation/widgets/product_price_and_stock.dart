import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/models/product_model/product.dart';
import '../../../../core/theme/app_colors.dart';

class ProductPriceAndStock extends StatelessWidget {
  const ProductPriceAndStock({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 5,
      children: [
        Row(
          spacing: 8,
          children: [
            Row(
              children: [
                const Text("EGP "),
                Text(
                  product!.formattedPrice,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              product!.formattedPriceBeforeDiscount,
              style: theme.textTheme.headlineMedium!.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (product!.discountPercentage != null)
              Text(
                '-${product!.discountPercentage}%',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        Row(
          children: [
            const Icon(
              IconsaxPlusBold.bag_2,
              color: AppColors.primaryColor,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              product!.formattedStock,
              style: theme.textTheme.bodyMedium!.copyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
