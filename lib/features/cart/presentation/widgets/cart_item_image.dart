import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/product_item_entity.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.product});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.colorScheme.secondary,
        ),
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          height: double.infinity,
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
