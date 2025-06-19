import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';

import '../../../../core/widgets/drop_down_quantity_button.dart';
import '../../../../generated/locale_keys.g.dart';
import '../manager/cubit/product_cubit.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductCubit>().state.whenOrNull(
      success: (p) => p,
    );
    final theme = Theme.of(context);
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Padding(
        padding: EdgeInsets.all(
          ResponsiveLayout.isMobile(context) ? 16.0 : 0.0,
        ),
        child: Row(
          children: [
            const DropDownQuantityButton(),
            const SizedBox(width: 16),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final cubit = context.read<CartCubit>();
                final isProductInCart = cubit.isProductInCart(
                  product!.id.toString(),
                );
                return Expanded(
                  child: CustomFilledButton(
                    textStyle: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          isProductInCart
                              ? theme.colorScheme.onSurfaceVariant
                              : Colors.white,
                    ),
                    text:
                        isProductInCart
                            ? context.tr(LocaleKeys.cart_already_in_cart)
                            : context.tr(LocaleKeys.cart_add_to_cart),
                    buttonColor:
                        isProductInCart
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.primary,
                    onPressed:
                        isProductInCart
                            ? null
                            : () {
                              cubit.addToCart(product.toCartProduct());
                            },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
