import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';

import '../../../../core/routing/app_router_name.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: theme.colorScheme.surface,
      shadowColor: Colors.transparent,
      toolbarHeight: 80,
      centerTitle: false,
      title: Image.asset(
        isArabic(context)
            ? AppAssets.logoIonicLogoAr
            : AppAssets.logoIonicLogoEn,
        height: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(IconsaxPlusLinear.search_normal),
          onPressed: () {
            context.push(AppRouterName.searchRoute);
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(IconsaxPlusLinear.heart),
          onPressed: () {
            context.push(AppRouterName.favoriteRoute);
          },
        ),
      ],
    );
  }
}
