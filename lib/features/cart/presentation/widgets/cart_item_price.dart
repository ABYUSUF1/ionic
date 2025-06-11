import 'package:flutter/material.dart';

import '../../../../core/utils/functions/product_formatted.dart';
import '../../domain/entity/cart_entity.dart';

class CartItemPrice extends StatelessWidget {
  const CartItemPrice({super.key, required this.product});

  final CartEntity product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("EGP "),
            Text(
              formattedPrice(product.price),
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
        if (product.discount > 0) ...[
          Text(
            formattedPriceBeforeDiscount(product.price, product.discount) ?? '',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              decoration: TextDecoration.lineThrough,
              decorationColor: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            '-${product.discount}%',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
