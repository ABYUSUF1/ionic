import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductItemEntity productItem;
  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      width: 150,
      height: 380,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: CachedNetworkImage(imageUrl: productItem.imageUrl),
          ),
          const SizedBox(height: 10),
          Text(
            productItem.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: "Pulp Display",
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${productItem.rating} ⭐ (${productItem.reviewsCount} Reviews)",
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text("EGP "),
              Text(
                "${productItem.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pulp Display",
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(IconsaxPlusBold.truck_fast, size: 16),
              const SizedBox(width: 3),
              Text(
                productItem.stock > 0
                    ? "${productItem.stock} In Stock"
                    : "Out of Stock",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
