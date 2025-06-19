import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/models/destinations.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import 'features/cart/presentation/manager/cubit/cart_cubit.dart';

class MainBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final List<Destinations> destinations = [
      Destinations(
        label: context.tr(LocaleKeys.bottom_navigation_home),
        icon: IconsaxPlusLinear.home_2,
      ),
      Destinations(
        label: context.tr(LocaleKeys.bottom_navigation_categories),
        icon: IconsaxPlusLinear.category_2,
      ),
      Destinations(
        label: context.tr(LocaleKeys.bottom_navigation_cart),
        icon: IconsaxPlusLinear.bag_2,
      ),
      Destinations(
        label: context.tr(LocaleKeys.bottom_navigation_profile),
        icon: IconsaxPlusLinear.profile,
      ),
    ];

    final theme = Theme.of(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        await state.maybeWhen(
          authenticated: (authEntity) async {
            // Sync local guest cart only once per session
            print("Call syncLocalCartToRemote");
            await context.read<CartCubit>().syncLocalCartToRemote();
            if (context.mounted) {
              await context.read<DefaultAddressCubit>().fetchAddresses();
            }
          },
          unAuthenticated: () {
            context.read<CartCubit>().clearCart();
            context.read<DefaultAddressCubit>().clearAddresses();
          },
          orElse: () async {},
        );
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: theme.colorScheme.secondary,
          destinations:
              destinations
                  .map(
                    (destination) => NavigationDestination(
                      icon: Icon(destination.icon),
                      label: destination.label,
                      selectedIcon: Icon(
                        destination.icon,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
