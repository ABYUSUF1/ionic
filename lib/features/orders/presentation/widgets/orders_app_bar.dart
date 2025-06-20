import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../../../../generated/locale_keys.g.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomBackButton(),
                  ),
                  Image.asset(AppAssets.logoIonicLogo, height: 35),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                onTapOutside:
                    (_) => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  hintText: context.tr(
                    LocaleKeys.common_search_for,
                    args: ['Orders'],
                  ),
                  hintStyle: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  prefixIcon: const Icon(IconsaxPlusLinear.search_normal_1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.secondary,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(141);
}
