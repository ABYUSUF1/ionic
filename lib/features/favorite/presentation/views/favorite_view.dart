import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/buttons/custom_back_button.dart';
import 'package:ionic/core/widgets/text_field/search_field.dart';

import '../../../../core/widgets/products_grid_view/views/products_grid_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // return ProductsGridView(emptyTitle: "No favorite found", emptySubtitle: "Start adding favorite", emptySvgImage: isDarkMode ? AppAssets.illustrationsNoFavoriteIllustrationDark : AppAssets.illustrationsNoFavoriteIllustrationLight, isLoading: true, productsEntity: productsEntity)
    return Container();
  }
}
