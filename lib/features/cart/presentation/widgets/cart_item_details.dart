import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_font.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/presentation/widgets/cart_item_arrived_by.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/utils/functions/product_formatted.dart';
import 'cart_item_price.dart';

class CartItemDetails extends StatelessWidget {
  final CartEntity product;
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
            product.productItemEntity.brand.isEmpty
                ? context.tr(LocaleKeys.product_brand_unknown)
                : product.productItemEntity.brand,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: appFont(context),
            ),
          ),
          Text(
            product.productItemEntity.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: appFont(context),
            ),
          ),
          const SizedBox(height: 16),
          CartItemPrice(product: product),

          const SizedBox(height: 16),
          CartItemArrivedBy(
            deliveryDays: product.productItemEntity.deliveryDays,
          ),

          isFreeDelivery(product.productItemEntity.price)
              ? Row(
                spacing: 8,
                children: [
                  const Icon(
                    IconsaxPlusBold.truck_tick,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    context.tr(LocaleKeys.product_free_delivery),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontFamily: appFont(context),
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
          Row(
            spacing: 8,
            children: [
              Icon(
                IconsaxPlusBold.back_square,
                size: 18,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              Text(
                formattedReturnPolicy(context, product.returnPolicy),
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontFamily: appFont(context),
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
