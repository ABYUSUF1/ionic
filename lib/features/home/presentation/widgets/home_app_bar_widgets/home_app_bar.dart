import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';

import '../../../../../core/routing/app_router_name.dart';
import 'home_app_bar_address_button.dart';
import 'home_app_bar_favorite_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      toolbarHeight: 120,
      backgroundColor: theme.colorScheme.surface,
      pinned: true,
      title: Column(
        children: [
          Row(
            children: [
              Image.asset(
                isArabic(context)
                    ? AppAssets.logoIonicLogoAr
                    : AppAssets.logoIonicLogo,
                height: 40,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(IconsaxPlusLinear.search_normal_1),
                onPressed: () {
                  context.push(AppRouterName.searchRoute);
                },
              ),

              const SizedBox(width: 10),
              const HomeAppBarFavoriteButton(),
            ],
          ),
          const HomeAppBarAddressButton(),
        ],
      ),
    );
  }
}
