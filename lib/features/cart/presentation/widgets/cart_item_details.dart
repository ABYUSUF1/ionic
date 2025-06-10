import 'package:flutter/material.dart';
import 'package:ionic/core/constants/app_font.dart';

import '../../../../core/entities/product_item_entity.dart';

class CartItemDetails extends StatelessWidget {
  final ProductItemEntity product;
  const CartItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.brand,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: appFont(context),
            ),
          ),
          Text(
            product.title,
            maxLines: 2,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: appFont(context),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "EGP ${product.price.toString()}",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontFamily: appFont(context),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
