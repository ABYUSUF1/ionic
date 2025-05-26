import 'package:flutter/material.dart';

import '../../../../core/models/product_model/product.dart';
import '../../../../core/theme/app_colors.dart';

class ProductTitleAndBrand extends StatelessWidget {
  final Product product;
  const ProductTitleAndBrand({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product.brand ?? "Unknown Brand",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product.category ?? "Unknown Category",
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          product.title ?? "Unknown Product",
          style: theme.textTheme.bodyLarge!.copyWith(
            fontFamily: "Pulp Display",
          ),
        ),
      ],
    );
  }
}
