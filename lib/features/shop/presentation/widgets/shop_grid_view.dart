import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';

import '../../../../core/entities/product_item_entity.dart';
import '../../../../core/widgets/loading/skeleton_loading.dart';
import '../../../../core/widgets/products_grid_view/widgets/product_item.dart';
import '../manager/cubit/shop_cubit.dart';

class ShopGridView extends StatelessWidget {
  final List<Product> products;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final bool isLoading;
  const ShopGridView({
    super.key,
    required this.products,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 352,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < products.length) {
              return ProductItem(
                productItem: products[index].toProductItem(),
                product: products[index],
                isLoading: false,
              );
            } else if (isLoadingMore) {
              return SkeletonLoading(
                isLoading: true,
                child: ProductItem(
                  productItem: ProductItemEntity.loading(),
                  product: null,
                  isLoading: true,
                ),
              );
            } else if (!hasReachedMax) {
              // Add a small delay to prevent too rapid triggering
              Future.delayed(const Duration(milliseconds: 100), () {
                if (!context.mounted) return;
                context.read<ShopCubit>().fetchProducts(loadMore: true);
              });
              return SkeletonLoading(
                isLoading: true,
                child: ProductItem(
                  productItem: ProductItemEntity.loading(),
                  product: null,
                  isLoading: true,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
          childCount: isLoading ? 2 : products.length + (hasReachedMax ? 0 : 1),
        ),
      ),
    );
  }
}
