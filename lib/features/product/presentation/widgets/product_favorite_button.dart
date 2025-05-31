import 'package:flutter/material.dart';

import '../../../../core/entities/product_item_entity.dart';
import '../../../../core/widgets/products_grid_view/widgets/favorite_button.dart';
import '../../../../core/widgets/responsive_layout.dart';

class ProductFavoriteButton extends StatelessWidget {
  final ProductItemEntity productItemEntity;
  const ProductFavoriteButton({super.key, required this.productItemEntity});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isMobile = ResponsiveLayout.isMobile(context);
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: isMobile ? colorScheme.secondary : colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FavoriteButton(productItem: productItemEntity),
    );
  }
}
