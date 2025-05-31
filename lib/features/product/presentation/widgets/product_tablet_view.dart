import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/product/presentation/widgets/product_bottom_bar.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/models/product_model/product.dart';
import 'product_additional_info.dart';
import 'product_favorite_button.dart';
import 'product_images.dart';
import 'product_overview.dart';
import 'product_price_and_stock.dart';
import 'product_rating_count.dart';
import 'product_tags.dart';
import 'product_title_and_brand.dart';

class ProductTabletView extends StatelessWidget {
  final Product? product;
  const ProductTabletView({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.product_details))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Column(
                          spacing: 30,
                          children: [
                            ProductImages(images: product!.images),
                            const ProductBottomBar(),
                          ],
                        ),
                        const ProductFavoriteButton(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleAndBrand(product: product!),
                          const SizedBox(height: 16),
                          ProductRatingCount(product: product!),
                          const SizedBox(height: 16),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 50, // Minimum height
                            ),
                            child: Text(
                              product?.description ??
                                  "No description available",
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true, // Enable text wrapping
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ProductPriceAndStock(product: product),
                          const SizedBox(height: 16),
                          ProductAdditionalInfo(product: product!),
                          const SizedBox(height: 16),
                          ProductTags(product: product!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 30),
              ProductOverview(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
