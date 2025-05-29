import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/widgets/empty_widget.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_grid.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_cubit.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_grid_app_bar.dart';

class ProductsGridView extends StatelessWidget {
  final ProductsEntity productsEntity;
  final String emptyTitle, emptySubtitle, emptySvgImage;
  final bool isLoading;
  const ProductsGridView({
    super.key,
    required this.emptyTitle,
    required this.emptySubtitle,
    required this.emptySvgImage,
    required this.isLoading,
    required this.productsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
          appBar: const ProductsGridAppBar(),
          body: ProductsGrid(
            productsItem: productsEntity.productsToProductItems(),
            products: null,
            isLoading: true,
          ),
        )
        : BlocProvider(
          create: (context) => ProductsControlCubit(productsEntity),
          child: BlocBuilder<ProductsControlCubit, ProductsEntity>(
            builder: (context, state) {
              final productsItem = state.productsToProductItems();

              return Scaffold(
                appBar: const ProductsGridAppBar(),
                body:
                    productsItem.isEmpty
                        ? EmptyWidget(
                          svgImage: emptySvgImage,
                          title: emptyTitle,
                          subtitle: emptySubtitle,
                        )
                        : ProductsGrid(
                          productsItem: productsItem,
                          products: state.products,
                          isLoading: false,
                        ),
              );
            },
          ),
        );
  }
}
