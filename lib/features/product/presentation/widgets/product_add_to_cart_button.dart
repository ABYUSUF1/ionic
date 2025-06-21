import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';

import '../../../../generated/locale_keys.g.dart';
import '../manager/cubit/product_cubit.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return
    /// ✅ Only rebuild when quantity or product changes
    BlocBuilder<ProductCubit, ProductState>(
      buildWhen:
          (prev, curr) => curr.whenOrNull(success: (p, q) => true) == true,
      builder: (context, state) {
        final result = state.whenOrNull(success: (p, q) => (p, q));
        final product = result?.$1;
        final quantity = result?.$2 ?? 1;

        if (product == null) return const SizedBox.shrink();

        /// ✅ Only rebuild this part when cart changes for this product
        return BlocSelector<CartCubit, CartState, bool>(
          selector: (state) {
            return context.read<CartCubit>().isProductInCart(
              product.id.toString(),
            );
          },
          builder: (context, isInCart) {
            return Expanded(
              child: CustomFilledButton(
                textStyle: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      isInCart
                          ? theme.colorScheme.onSurfaceVariant
                          : Colors.white,
                ),
                text:
                    isInCart
                        ? context.tr(LocaleKeys.cart_already_in_cart)
                        : context.tr(LocaleKeys.cart_add_to_cart),
                buttonColor:
                    isInCart
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.primary,
                onPressed:
                    isInCart
                        ? null
                        : () {
                          context.read<CartCubit>().addToCart(
                            product.toCartProduct(quantity),
                          );
                        },
              ),
            );
          },
        );
      },
    );
  }
}
