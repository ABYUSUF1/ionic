import 'package:flutter/material.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

import '../../../../core/utils/functions/product_formatted.dart';

class CartItemPrice extends StatelessWidget {
  const CartItemPrice({super.key, required this.product});

  final CartProductEntity product;

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
              formattedPrice(product.productItem.price),
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
        if (product.productItem.discount > 0) ...[
          Text(
            formattedPriceBeforeDiscount(
                  product.productItem.price,
                  product.productItem.discount,
                ) ??
                '',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              decoration: TextDecoration.lineThrough,
              decorationColor: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            '-${product.productItem.discount}%',
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
