import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/theme/app_font.dart';

class HomeCategoriesUpper extends StatelessWidget {
  const HomeCategoriesUpper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr(LocaleKeys.bottom_navigation_categories),
            textAlign: TextAlign.start,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontFamily: appFont(context)),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text(context.tr(LocaleKeys.common_view_all)),
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
