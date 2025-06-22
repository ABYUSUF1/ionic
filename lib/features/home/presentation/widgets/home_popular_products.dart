import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/product_grid_horizontal.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';
import 'package:ionic/features/home/presentation/manager/popular_products/popular_products_cubit.dart';

import '../../../../generated/locale_keys.g.dart';

class HomePopularProducts extends StatelessWidget {
  const HomePopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => PopularProductsCubit(getIt<HomeRepo>()),
        child: BlocBuilder<PopularProductsCubit, PopularProductsState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );
            final List<Product> products = state.maybeWhen(
              success: (productsEntity) => productsEntity.products,
              orElse: () => [],
            );

            return ProductGridHorizontal(
              title: context.tr(LocaleKeys.home_popular_products),
              isLoading: isLoading,
              products: products,
              productItems: products.map((e) => e.toProductItem()).toList(),
            );
          },
        ),
      ),
    );
  }
}
