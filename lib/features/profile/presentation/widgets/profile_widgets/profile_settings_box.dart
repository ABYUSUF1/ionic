import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/custom_profile_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/theme/dark_mode_switch_button.dart';
import '../../manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';
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
          section: ProfileButtonEnum.notifications,
          onTap: () {
            context.pushNamed(AppRouterName.notificationsRoute);
          },
        ),
        const CustomLanguageButton(),
        const DarkModeSwitchButton(),
        CustomProfileListTile(
          title: context.tr(LocaleKeys.profile_account_privacy),
          icon: IconsaxPlusLinear.lock,
          requireAuth: true,
          section: ProfileButtonEnum.accountPrivacy,
          onTap: () {
            context.pushNamed(AppRouterName.accountPrivacyRoute);
          },
        ),
      ],
    );
  }
}
