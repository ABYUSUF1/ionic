import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/required_login_widget.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';

import '../../../../core/entities/product_item_entity.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/products_grid_view/views/products_grid_view.dart';
import '../../../../generated/locale_keys.g.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return RequiredLoginScreen(
      appBarTitle: context.tr(LocaleKeys.favorites_title),
      description: context.tr(LocaleKeys.favorites_sign_in_required_desc),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          List<ProductItemEntity> productsItem = state.maybeWhen(
            orElse: () => [],
            success: (productsItems) {
              return productsItems;
            },
          );
          return ProductsGridView(
            emptyTitle: context.tr(LocaleKeys.favorites_empty),
            emptySubtitle: context.tr(LocaleKeys.favorites_empty_desc),
            emptySvgImage:
                isDarkMode
                    ? AppAssets.illustrationsNoFavoriteIllustrationDark
                    : AppAssets.illustrationsNoFavoriteIllustrationLight,
            isLoading: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            productItems: productsItem,
            products: null,
            searchHintText: context.tr(
              LocaleKeys.common_search_for,
              args: [LocaleKeys.favorites_title.tr()],
            ),
            searchHelperText: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${productsItem.length} ",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: context.tr(
                      LocaleKeys.favorites_items_in_favorites.plural(
                        productsItem.length,
                      ),
                    ),
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
