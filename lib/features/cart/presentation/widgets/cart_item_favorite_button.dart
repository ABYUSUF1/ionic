import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';

class CartItemFavoriteButton extends StatelessWidget {
  final CartProductEntity product;
  const CartItemFavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFavorite = cubit.isFavorite(product.productItem.productId);
        return IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
          icon: Icon(
            isFavorite ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart_add,
            color:
                isFavorite
                    ? theme.colorScheme.error
                    : theme.colorScheme.onSurface,
          ),
          onPressed: () {
            cubit.toggleFavorites(product.productItem, context);
          },
        );
      },
    );
  }
}
