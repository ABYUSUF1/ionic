import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/shop/presentation/widgets/shop_error_widget.dart';
import 'package:ionic/features/shop/presentation/widgets/shop_grid_view.dart';

import '../manager/cubit/shop_cubit.dart';

class ShopProductsGrid extends StatelessWidget {
  const ShopProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial:
              () => const ShopGridView(
                products: [],
                isLoadingMore: false,
                hasReachedMax: false,
                isLoading: true,
              ),
          loading:
              () => const ShopGridView(
                products: [],
                isLoadingMore: false,
                hasReachedMax: false,
                isLoading: true,
              ),
          success:
              (products, hasReachedMax) => ShopGridView(
                products: products,
                isLoadingMore: false,
                hasReachedMax: hasReachedMax,
                isLoading: false,
              ),
          loadingMore:
              (products) => ShopGridView(
                products: products,
                isLoadingMore: true,
                hasReachedMax: false,
                isLoading: false,
              ),
          error: (message) => ShopErrorWidget(errorMessage: message),
          orElse:
              () => const SliverToBoxAdapter(
                child: Center(child: Text('Something went wrong')),
              ),
        );
      },
    );
  }
}
