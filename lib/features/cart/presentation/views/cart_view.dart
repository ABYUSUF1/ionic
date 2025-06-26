import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/entities/order_summary_entity.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
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

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final (
          CartEntity cartEntity,
          OrderSummaryEntity cartOrderSummary,
        ) = state.maybeWhen(
          success:
              (cartEntity, cartOrderSummary) => (cartEntity, cartOrderSummary),
          orElse:
              () => (
                const CartEntity(cartProductsEntity: []),
                OrderSummaryEntity.loading(),
              ),
        );

        return Scaffold(
          backgroundColor:
              !state.isSuccess
                  ? theme.colorScheme.surface
                  : theme.scaffoldBackgroundColor,
          appBar: CartAppBar(cartEntity: cartEntity),
          bottomNavigationBar:
              !ResponsiveLayout.isMobile(context)
                  ? null
                  : CartBottomBar(cartOrderSummary: cartOrderSummary),
          body: state.maybeWhen(
            empty:
                () => EmptyStateWidget.withButton(
                  svgImage:
                      isDark
                          ? AppAssets.illustrationsEmptyIllustrationDark
                          : AppAssets.illustrationsEmptyIllustrationLight,
                  title: context.tr(LocaleKeys.cart_empty_title),
                  subtitle: context.tr(LocaleKeys.cart_empty_desc),
                  buttonText: context.tr(LocaleKeys.cart_shop_now),
                  onButtonPressed:
                      () => context.goNamed(AppRouterName.homeRoute),
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
                  cartEntity: cartEntity,
                  cartOrderSummary: cartOrderSummary,
                ),
          ),
        );
      },
    );
  }
}
