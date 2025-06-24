import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/product_grid_horizontal.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/services/di/get_it_service.dart';
import '../../domain/repo/home_repo.dart';
import '../manager/recently_viewed_products/recently_viewed_products_cubit.dart';

class HomeRecentlyViewedProducts extends StatelessWidget {
  const HomeRecentlyViewedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => RecentlyViewedProductsCubit(getIt<HomeRepo>()),
        child: BlocBuilder<
          RecentlyViewedProductsCubit,
          RecentlyViewedProductsState
        >(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );

            final List<ProductItemEntity> productItems = state.maybeWhen(
              success: (productsEntity) => productsEntity,
              orElse: () => [],
            );

            return productItems.isEmpty
                ? const SizedBox.shrink()
                : ProductGridHorizontal(
                  title: context.tr(LocaleKeys.home_recently_viewed_products),
                  isLoading: isLoading,
                  productItems: productItems,
                );
          },
        ),
      ),
    );
  }
}
