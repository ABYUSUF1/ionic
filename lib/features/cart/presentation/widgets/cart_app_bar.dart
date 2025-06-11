import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/constants/app_font.dart';
import '../../../home/presentation/widgets/home_app_bar_widgets/home_app_bar_address_button.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<CartEntity> products;
  const CartAppBar({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      flexibleSpace: Container(
        color: theme.colorScheme.surface,
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                spacing: 8,
                children: [
                  Text(
                    context.tr(LocaleKeys.bottom_navigation_cart),
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontFamily: appFont(context),
                    ),
                  ),
                  SkeletonLoading(
                    isLoading: context.read<CartCubit>().state.isLoading,
                    child: Text(
                      '(${context.plural(LocaleKeys.cart_items_in_cart, products.length, args: [products.length.toString()])})',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontFamily: appFont(context),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconsaxPlusLinear.heart,
                      size: 24,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),

              const HomeAppBarAddressButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136);
}
