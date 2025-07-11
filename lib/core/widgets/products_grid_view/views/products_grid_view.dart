import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_state.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_grid.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_cubit.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_grid_app_bar.dart';

import '../../../../generated/locale_keys.g.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product>? products;
  final List<ProductItemEntity> productItems;
  final String emptyTitle, emptySubtitle, emptySvgImage;
  final bool isLoading;
  final Widget searchHelperText;
  final String searchHintText;
  const ProductsGridView({
    super.key,
    required this.emptyTitle,
    required this.emptySubtitle,
    required this.emptySvgImage,
    required this.isLoading,
    required this.productItems,
    required this.searchHelperText,
    required this.searchHintText,
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return isLoading
        ? Scaffold(
          appBar: ProductsGridAppBar(
            showSearchField: false,
            helperText: Text(context.tr(LocaleKeys.common_loading)),
            hintText: '',
          ),
          body: SkeletonLoading(
            isLoading: true,
            child: ProductsGrid(
              productsItem: productItems,
              products: null,
              isLoading: true,
            ),
          ),
        )
        : BlocProvider(
          create:
              (context) => ProductsControlCubit()..updateProducts(productItems),
          child: BlocBuilder<ProductsControlCubit, ProductsControlState>(
            builder: (context, state) {
              if (state.originalProductItems.length != productItems.length) {
                context.read<ProductsControlCubit>().updateProducts(
                  productItems,
                );
              }
              return Scaffold(
                backgroundColor:
                    productItems.isEmpty
                        ? theme.colorScheme.surface
                        : theme.scaffoldBackgroundColor,
                appBar: ProductsGridAppBar(
                  helperText: searchHelperText,
                  hintText: searchHintText,
                  showSearchField: productItems.isNotEmpty,
                ),
                body:
                    state.filteredProducts.isEmpty
                        ? EmptyStateWidget(
                          svgImage: emptySvgImage,
                          title: emptyTitle,
                          subtitle: emptySubtitle,
                        )
                        : ProductsGrid(
                          productsItem: state.filteredProducts,
                          products: products,
                          isLoading: false,
                        ),
              );
            },
          ),
        );
  }
}
