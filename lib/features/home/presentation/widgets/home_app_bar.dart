import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';

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
                  // Handle notification button press
                },
              ),

              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(IconsaxPlusLinear.heart),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ],
          ),
          ListTile(
            onTap: () {
              /* Handle address selection */
            },
            leading: Icon(
              IconsaxPlusLinear.location,
              size: 24,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            title: Text(
              "مدينة القاهرة بي مدينة نصر شارع 33 شقة 300",
              style: theme.textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(
              IconsaxPlusLinear.arrow_down,
              size: 24,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
