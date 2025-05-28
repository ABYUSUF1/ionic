import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';
import 'package:ionic/core/widgets/buttons/custom_back_button.dart';
import 'package:ionic/core/widgets/text_field/search_field.dart';
import 'package:ionic/features/categories/presentation/widgets/categories_app_bar_settings_button.dart';
import 'package:ionic/features/home/data/models/category_model/localized_title.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LocalizedTitle categoryName;
  final String totalProducts;

  const CategoriesAppBar({
    super.key,
    required this.categoryName,
    required this.totalProducts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isAr = isArabic(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Stack(
              children: [
                const CustomBackButton(),
                Center(
                  child: Image.asset(
                    isAr ? AppAssets.logoIonicLogoAr : AppAssets.logoIonicLogo,
                    height: 40,
                  ),
                ),
              ],
            ),
            const Row(
              spacing: 16,
              children: [SearchField(), CategoriesAppBarSettingsButton()],
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: totalProducts,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " ${context.tr(LocaleKeys.common_result_for)} ",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text:
                        "' ${isArabic(context) ? categoryName.ar : categoryName.en} '",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(190);
}
