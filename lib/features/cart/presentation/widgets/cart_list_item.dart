import 'package:flutter/material.dart';

import '../../../../core/entities/product_item_entity.dart';
import 'cart_item_details.dart';
import 'cart_item_image.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.product});
  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 200,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Expanded(
            child: Row(
              spacing: 16,
              children: [
                CartItemImage(product: product),
                CartItemDetails(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
