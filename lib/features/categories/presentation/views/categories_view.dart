import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/products_grid_view/views/products_grid_view.dart';
import 'package:ionic/features/categories/domain/repo/categories_repo.dart';
import 'package:ionic/features/categories/presentation/manager/cubit/categories_cubit.dart';
import '../../../home/data/models/category_model/localized_title.dart';

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
          return ProductsGridView(
            emptyTitle: "No products found",
            emptySubtitle: "Try searching for something else",
            emptySvgImage:
                Theme.of(context).brightness == Brightness.dark
                    ? AppAssets.illustrationsEmptyIllustrationDark
                    : AppAssets.illustrationsEmptyIllustrationDark,
            isLoading: state.maybeWhen(
              orElse: () => false,
              loading: (_) => true,
            ),
            productsEntity: productsEntity,
          );
        },
      ),
    );
  }
}
