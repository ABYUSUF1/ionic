import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/features/home/presentation/manager/popular_products/popular_products_cubit.dart';

import '../../../../../core/widgets/products_grid_view/widgets/product_item.dart';
import '../../../domain/repo/home_repo.dart';

class HomePopularProductsGrid extends StatelessWidget {
  const HomePopularProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularProductsCubit(getIt<HomeRepo>()),
      child: BlocBuilder<PopularProductsCubit, PopularProductsState>(
        builder: (context, state) {
          return Expanded(
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
              itemCount:
                  state.whenOrNull(
                    success: (productsEntity) => productsEntity.products.length,
                  ) ??
                  0,
              itemBuilder: (BuildContext context, int index) {
                final product = state.whenOrNull(
                  success: (productsEntity) => productsEntity.products[index],
                );
                if (product == null) {
                  return const SizedBox.shrink();
                }
                return ProductItem(
                  product: product,
                  productItem: product.toProductItem(),
                  isLoading: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
