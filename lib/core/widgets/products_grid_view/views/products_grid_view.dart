import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/empty_widget.dart';
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
    return isLoading
        ? Scaffold(
          appBar: ProductsGridAppBar(
            helperText: Text(context.tr(LocaleKeys.common_loading)),
            hintText: '',
          ),
          body: ProductsGrid(
            productsItem: productItems,
            products: null,
            isLoading: true,
          ),
        )
        : BlocProvider(
          create: (context) => ProductsControlCubit(productItems),
          child: BlocBuilder<ProductsControlCubit, ProductsControlState>(
            builder: (context, state) {
              return Scaffold(
                appBar: ProductsGridAppBar(
                  helperText: searchHelperText,
                  hintText: searchHintText,
                ),
                body:
                    state.filteredProducts.isEmpty
                        ? EmptyWidget(
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
