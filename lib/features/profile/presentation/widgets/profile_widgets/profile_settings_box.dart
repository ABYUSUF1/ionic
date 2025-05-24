import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/custom_profile_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/theme/dark_mode_switch_button.dart';
import 'custom_language_button.dart';
import 'custom_profile_list_tile.dart';

class ProfileSettingsBox extends StatelessWidget {
  const ProfileSettingsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: context.tr(LocaleKeys.profile_my_settings),
      children: [
        CustomProfileListTile(
          title: context.tr(LocaleKeys.profile_notifications),
          icon: IconsaxPlusLinear.notification,
          onTap: () {},
        ),
        CustomLanguageButton(),
        DarkModeSwitchButton(),
        CustomProfileListTile(
          title: "Account Privacy",
          icon: IconsaxPlusLinear.lock,
          onTap: () {},
        ),
      ],
    );
  }
}
