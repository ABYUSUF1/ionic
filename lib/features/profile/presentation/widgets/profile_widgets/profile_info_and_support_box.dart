import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'package:share_plus/share_plus.dart';

import 'custom_profile_box.dart';
import 'custom_profile_list_tile.dart';

class ProfileInfoAndSupportBox extends StatelessWidget {
  const ProfileInfoAndSupportBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: LocaleKeys.profile_info_and_support.tr(),
      children: [
        CustomProfileListTile(
          title: context.tr(LocaleKeys.profile_about_us),
          icon: IconsaxPlusLinear.people,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_help_center.tr(),
          icon: IconsaxPlusLinear.headphone,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_share_app.tr(),
          icon: IconsaxPlusLinear.share,
          onTap: () async {
            // 1. Show loading dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );

            // 2. Optional delay to show loading
            await Future.delayed(const Duration(milliseconds: 300));

            // 3. Share the app
            await SharePlus.instance.share(
              ShareParams(
                title: "Ionic E-commerce Flutter App",
                text: "Check out this amazing app!",
                subject: "Ionic App",
              ),
            );

            // 4. Dismiss loading
            if (context.mounted) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          },
        ),
      ],
    );
  }
}
