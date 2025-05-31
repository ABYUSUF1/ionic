import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/products_grid_view/views/products_grid_view.dart';
import 'package:ionic/features/categories/domain/repo/categories_repo.dart';
import 'package:ionic/features/categories/presentation/manager/cubit/categories_cubit.dart';
import '../../../../core/utils/functions/is_arabic.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../home/data/models/category_model/localized_title.dart';

class CategoriesView extends StatelessWidget {
  final LocalizedTitle categoryName;
  const CategoriesView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  CategoriesCubit(getIt<CategoriesRepo>())
                    ..getCategories(categoryName: categoryName.toSlug()),
        ),
      ],
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          ProductsEntity productsEntity = state.maybeWhen(
            orElse: () => ProductsEntity.loading(),
            success: (productsEntity) {
              return productsEntity;
            },
          );
          return ProductsGridView(
            emptyTitle: "No products found",
            emptySubtitle: "Try searching for something else",
            emptySvgImage:
                theme.brightness == Brightness.dark
                    ? AppAssets.illustrationsEmptyIllustrationDark
                    : AppAssets.illustrationsEmptyIllustrationDark,
            isLoading: state.maybeWhen(
              orElse: () => false,
              loading: (_) => true,
            ),
            productItems: productsEntity.productsToProductItems(),
            products: productsEntity.products,
            searchHintText: context.tr(
              LocaleKeys.common_search_for,
              args: [isArabic(context) ? categoryName.ar : categoryName.en],
            ),
            searchHelperText: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${productsEntity.products.length} ",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: " ${context.tr(LocaleKeys.common_result_for)} ",
                    style: theme.textTheme.bodySmall,
                  ),
                  TextSpan(
                    text:
                        "' ${isArabic(context) ? categoryName.ar : categoryName.en} '",
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
