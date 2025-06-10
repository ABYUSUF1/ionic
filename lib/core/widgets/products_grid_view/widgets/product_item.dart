import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';

import '../../../constants/app_font.dart';
import '../../../utils/functions/product_formatted.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  final ProductItemEntity productItem;
  final bool isLoading;
  const ProductItem({
    super.key,
    required this.productItem,
    this.product,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SkeletonLoading(
      isLoading: isLoading,
      child: GestureDetector(
        onTap:
            isLoading
                ? null
                : () {
                  context.push(
                    AppRouterName.productIdRoute(productItem.id),
                    extra: product,
                  );
                },
        child: Container(
          padding: const EdgeInsets.all(8),
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
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child:
                        isLoading
                            ? null
                            : CachedNetworkImage(
                              imageUrl: productItem.imageUrl,
                            ),
                  ),
                  FavoriteButton(productItem: productItem),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                productItem.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontFamily: appFont(context),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${productItem.rating} ⭐ (${formattedReviewsCount(context, productItem.reviewsCount)}) ",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text("EGP "),
                  Text(
                    "${productItem.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: appFont(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(IconsaxPlusBold.truck_fast, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    formattedStock(context, productItem.stock),
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
