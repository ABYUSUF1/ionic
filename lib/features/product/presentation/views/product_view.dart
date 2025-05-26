import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/features/product/presentation/widgets/product_rating_count.dart';
import 'package:ionic/features/product/presentation/widgets/product_tags.dart';
import 'package:ionic/features/product/presentation/widgets/product_title_and_brand.dart';

import '../widgets/product_additional_info.dart';
import '../widgets/product_bottom_bar.dart';
import '../widgets/product_favorite_button.dart';
import '../widgets/product_images.dart';
import '../widgets/product_overview.dart';
import '../widgets/product_price_and_stock.dart';

class ProductView extends StatelessWidget {
  final String productId;
  final Product? product;
  const ProductView({super.key, this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    print("Product: ${product!.title}");
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      bottomNavigationBar: const ProductBottomBar(),
      appBar: AppBar(title: const Text("Product View")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitleAndBrand(product: product!),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductRatingCount(product: product!),
                  const ProductFavoriteButton(),
                ],
              ),
              const SizedBox(height: 16),
              ProductImages(images: product?.images ?? []),
              const SizedBox(height: 16),
              Text(
                product?.description ?? "No description available",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ProductPriceAndStock(product: product),
              const SizedBox(height: 16),
              ProductAdditionalInfo(product: product!),
              const SizedBox(height: 16),
              ProductTags(product: product!),
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
