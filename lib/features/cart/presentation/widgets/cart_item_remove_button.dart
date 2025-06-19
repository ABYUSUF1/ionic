import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

import '../manager/cubit/cart_cubit.dart';

class CartItemRemoveButton extends StatelessWidget {
  final CartProductEntity product;
  const CartItemRemoveButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      icon: Icon(IconsaxPlusLinear.trash, color: theme.colorScheme.onSurface),
      onPressed: () {
        context.read<CartCubit>().removeFromCart(product.productItem.productId);
      },
    );
  }
}
