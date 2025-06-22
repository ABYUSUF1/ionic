import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/product_grid_horizontal.dart';

import '../../../../core/services/di/get_it_service.dart';
import '../../domain/repo/home_repo.dart';
import '../manager/recently_products/recently_products_cubit.dart';

class HomeRecentlyProducts extends StatelessWidget {
  const HomeRecentlyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => RecentlyProductsCubit(getIt<HomeRepo>()),
        child: BlocBuilder<RecentlyProductsCubit, RecentlyProductsState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );

            final List<ProductItemEntity> productItems = state.maybeWhen(
              success: (productsEntity) => productsEntity,
              orElse: () => [],
            );

            return ProductGridHorizontal(
              title: "Recently Products",
              isLoading: isLoading,
              productItems: productItems,
            );
          },
        ),
      ),
    );
  }
}
