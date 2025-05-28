import 'package:flutter/material.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/widgets/product_item.dart';

import '../models/product_model/product.dart';

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
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 350,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: isLoading ? 6 : productsItem.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            productItem: isLoading ? productsItem[0] : productsItem[index],
            product: isLoading ? products![0] : products?[index],
            isLoading: isLoading,
          );
        },
      ),
    );
  }
}
