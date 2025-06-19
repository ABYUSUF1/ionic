import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

import '../manager/cubit/cart_cubit.dart';

class CartItemQuantityButton extends StatelessWidget {
  final CartProductEntity product;
  const CartItemQuantityButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quantity = product.quantity;
    final cartCubit = context.watch<CartCubit>();

    return Row(
      children: [
        IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
          icon: Icon(
            Icons.remove,
            color:
                quantity == 1
                    ? theme.colorScheme.onSurfaceVariant
                    : theme.colorScheme.onSurface,
          ),
          onPressed:
              quantity == 1
                  ? null
                  : () => cartCubit.decrementQuantity(
                    product.productItem.productId,
                  ),
        ),
        Container(
          width: 60,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FadeInDown(
            key: ValueKey(product.quantity),
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            from: 10,
            child: Text(quantity.toString()),
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
          icon: Icon(Icons.add, color: theme.colorScheme.onSurface),
          onPressed:
              () => cartCubit.incrementQuantity(product.productItem.productId),
        ),
      ],
    );
  }
}
