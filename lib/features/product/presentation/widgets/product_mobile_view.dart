import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/product_model/product.dart';
import '../../../../generated/locale_keys.g.dart';
import 'product_additional_info.dart';
import 'product_bottom_bar.dart';
import 'product_favorite_button.dart';
import 'product_images.dart';
import 'product_overview.dart';
import 'product_price_and_stock.dart';
import 'product_rating_count.dart';
import 'product_tags.dart';
import 'product_title_and_brand.dart';

class ProductMobileView extends StatelessWidget {
  const ProductMobileView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      bottomNavigationBar: const ProductBottomBar(),
      appBar: AppBar(title: Text(context.tr(LocaleKeys.product_details))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitleAndBrand(product: product),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductRatingCount(product: product),
                  ProductFavoriteButton(
                    productItemEntity: product.toProductItem(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ProductImages(images: product.images),
              const SizedBox(height: 16),
              Text(
                product.description ?? "No description available",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ProductPriceAndStock(product: product),
              const SizedBox(height: 16),
              ProductAdditionalInfo(product: product),
              const SizedBox(height: 16),
              ProductTags(product: product),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              ProductOverview(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
