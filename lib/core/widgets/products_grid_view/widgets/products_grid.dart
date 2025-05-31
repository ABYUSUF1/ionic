import 'package:flutter/material.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/product_item.dart';

import '../../../models/product_model/product.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductItemEntity> productsItem;
  final List<Product>? products;
  final bool isLoading;
  const ProductsGrid({
    super.key,
    required this.productsItem,
    required this.isLoading,
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 352,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: isLoading ? 6 : productsItem.length,
      itemBuilder: (BuildContext context, int index) {
        if (isLoading) {
          return ProductItem(
            productItem: ProductItemEntity.loading(),
            product: null,
            isLoading: true,
          );
        }
        return ProductItem(
          productItem: productsItem[index],
          product:
              products != null && products!.length > index
                  ? products![index]
                  : null,
          isLoading: false,
        );
      },
    );
  }
}
