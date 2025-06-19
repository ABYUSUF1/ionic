import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';
import 'custom_profile_box.dart';
import 'custom_profile_list_tile.dart';

class ProfileMyPreferenceBox extends StatelessWidget {
  const ProfileMyPreferenceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: context.tr(LocaleKeys.profile_my_preference),
      children: [
        CustomProfileListTile(
          title: LocaleKeys.edit_profile_title.tr(),
          icon: IconsaxPlusLinear.user_edit,
          section: ProfileButtonEnum.editProfile,
          requireAuth: true,
          onTap: () {
            context.pushNamed(AppRouterName.editProfileRoute);
          },
        ),
        CustomProfileListTile(
          title: context.tr(LocaleKeys.profile_my_cart),
          icon: IconsaxPlusLinear.bag_2,
          requireAuth: true,
          onTap: () {
            context.pushNamed(AppRouterName.cartRoute);
          },
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_my_orders.tr(),
          icon: IconsaxPlusLinear.box,
          section: ProfileButtonEnum.myOrders,
          requireAuth: true,
          onTap: () {
            context.pushNamed(AppRouterName.ordersRoute);
          },
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_my_addresses.tr(),
          icon: IconsaxPlusLinear.location,
          section: ProfileButtonEnum.myAddresses,
          requireAuth: true,
          onTap: () {
            context.pushNamed(AppRouterName.defaultAddressRoute);
          },
        ),
      ],
    );
  }
}
