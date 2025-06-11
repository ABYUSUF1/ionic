import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/entity/cart_entity.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final List<CartEntity> products = state.maybeWhen(
          orElse: () => [],
          success: (products) => products,
        );
        return Scaffold(
          backgroundColor:
              !state.isSuccess
                  ? theme.colorScheme.surface
                  : theme.scaffoldBackgroundColor,
          appBar: CartAppBar(products: products),
          body: state.maybeWhen(
            orElse: () => const CartList(),
            empty:
                () => EmptyWidget(
                  svgImage:
                      isDark
                          ? AppAssets.illustrationsEmptyIllustrationDark
                          : AppAssets.illustrationsEmptyIllustrationLight,
                  title: context.tr(LocaleKeys.cart_empty_title),
                  subtitle: context.tr(LocaleKeys.cart_empty_desc),
                ),

            error:
                (errMessage) => EmptyWidget(
                  svgImage:
                      isDark
                          ? AppAssets.illustrationsErrorIllustrationDark
                          : AppAssets.illustrationsErrorIllustrationLight,
                  title: context.tr(LocaleKeys.common_something_went_wrong),
                  subtitle: errMessage,
                ),
          ),
        );
      },
    );
  }
}
