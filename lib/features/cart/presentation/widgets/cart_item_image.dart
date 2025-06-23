import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.product});

  final CartProductEntity product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = product.productItem.imageUrl;
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.colorScheme.secondary,
        ),
        child:
            imageUrl.isEmpty
                ? null
                : CachedNetworkImage(imageUrl: imageUrl, height: 200),
      ),
    );
  }
}
