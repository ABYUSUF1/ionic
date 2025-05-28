import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/products_grid.dart';
import 'package:ionic/features/categories/domain/repo/categories_repo.dart';
import 'package:ionic/features/categories/presentation/manager/cubit/categories_cubit.dart';
import '../../../home/data/models/category_model/localized_title.dart';
import '../widgets/categories_app_bar.dart';

class CategoriesView extends StatelessWidget {
  final LocalizedTitle categoryName;
  const CategoriesView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CategoriesCubit(getIt<CategoriesRepo>())
                ..getCategories(categoryName: categoryName.toSlug()),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          ProductsEntity productsEntity = state.maybeWhen(
            orElse: () => ProductsEntity.loading(),
            success: (productsEntity) => productsEntity,
          );
          return Scaffold(
            appBar: CategoriesAppBar(
              categoryName: categoryName,
              totalProducts: productsEntity.total.toString(),
            ),
            body: ProductsGrid(
              productsItem: productsEntity.productsToProductItems(),
              products: productsEntity.products,
              isLoading: state.maybeWhen(
                orElse: () => false,
                loading: (_) => true,
              ),
            ),
          );
        },
      ),
    );
  }
}
