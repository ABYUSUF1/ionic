import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/cart/domain/entity/cart_order_summary.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/entity/cart_entity.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_bottom_bar.dart';
import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        // state.isError ? context.read<CartCubit>().fetchCart() : null;
        final (
          List<CartEntity> products,
          CartOrderSummary cartOrderSummary,
        ) = state.maybeWhen(
          success: (products, cartOrderSummary) => (products, cartOrderSummary),
          orElse: () => ([], CartOrderSummary.loading()),
        );

        return Scaffold(
          backgroundColor:
              !state.isSuccess
                  ? theme.colorScheme.surface
                  : theme.scaffoldBackgroundColor,
          appBar: CartAppBar(products: products),
          bottomNavigationBar:
              width > 900
                  ? null
                  : CartBottomBar(cartOrderSummary: cartOrderSummary),
          body: state.maybeWhen(
            empty:
                () => EmptyStateWidget(
                  svgImage:
                      isDark
                          ? AppAssets.illustrationsEmptyIllustrationDark
                          : AppAssets.illustrationsEmptyIllustrationLight,
                  title: context.tr(LocaleKeys.cart_empty_title),
                  subtitle: context.tr(LocaleKeys.cart_empty_desc),
                ),
            error:
                (errMessage) => EmptyStateWidget(
                  svgImage:
                      isDark
                          ? AppAssets.illustrationsErrorIllustrationDark
                          : AppAssets.illustrationsErrorIllustrationLight,
                  title: context.tr(LocaleKeys.common_something_went_wrong),
                  subtitle: errMessage,
                ),
            orElse:
                () => CartViewBody(
                  products: products,
                  cartOrderSummary: cartOrderSummary,
                ),
          ),
        );
      },
    );
  }
}
