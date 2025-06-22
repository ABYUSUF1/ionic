import 'package:flutter/material.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';

import '../../../theme/app_font.dart';
import 'product_item.dart';

class ProductGridHorizontal extends StatelessWidget {
  final String title;
  final List<Product>? products;
  final List<ProductItemEntity> productItems;
  final bool isLoading;
  const ProductGridHorizontal({
    super.key,
    required this.title,
    this.products,
    required this.isLoading,
    required this.productItems,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 430,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 16.0, start: 16),
            child: Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontFamily: appFont(context),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _CustomGridHorizontalView(productItems, products, isLoading),
        ],
      ),
    );
  }
}

class _CustomGridHorizontalView extends StatelessWidget {
  final List<ProductItemEntity> productsItem;
  final List<Product>? products;
  final bool isLoading;

  const _CustomGridHorizontalView(
    this.productsItem,
    this.products,
    this.isLoading,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SkeletonLoading(
        isLoading: isLoading,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            mainAxisExtent: 150,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: isLoading ? 6 : productsItem.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              product: isLoading ? Product.loading() : products?[index],
              productItem:
                  isLoading ? ProductItemEntity.loading() : productsItem[index],
              isLoading: isLoading,
            );
          },
        ),
      ),
    );
  }
}
