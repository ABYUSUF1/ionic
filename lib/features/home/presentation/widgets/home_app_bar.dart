import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final theme = Theme.of(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: theme.colorScheme.surface,
      expandedHeight: 136,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    isArabic
                        ? AppAssets.logoIonicLogoAr
                        : AppAssets.logoIonicLogo,
                    height: 40,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconsaxPlusLinear.search_normal_1,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconsaxPlusLinear.heart,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  "مدينة القاهرة بي مدينة نصر شارع 33 شقة 300",
                  style: theme.textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Icon(IconsaxPlusLinear.location, size: 24),
                trailing: Icon(IconsaxPlusLinear.arrow_down, size: 24),
              ),
            ],
          ),
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      actions: [],
    );
  }
}
