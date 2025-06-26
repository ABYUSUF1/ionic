import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/address_button.dart';

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
              IconButton(
                icon: const Icon(IconsaxPlusLinear.heart),
                onPressed: () {
                  context.push(AppRouterName.favoriteRoute);
                },
              ),
            ],
          ),
          const AddressButton(),
        ],
      ),
    );
  }
}
