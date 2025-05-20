import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/routing/app_router_name.dart';
import 'custom_profile_box.dart';
import 'custom_profile_list_tile.dart';

class ProfileMyPreferenceBox extends StatelessWidget {
  const ProfileMyPreferenceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: "My preferences",
      children: [
        CustomProfileListTile(
          title: "Edit Profile",
          icon: IconsaxPlusLinear.user_edit,
          onTap: () {
            context.pushNamed(AppRouterName.editProfileRoute);
          },
        ),
        CustomProfileListTile(
          title: "My Cart",
          icon: IconsaxPlusLinear.bag_2,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: "My Orders",
          icon: IconsaxPlusLinear.box,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: "My Addresses",
          icon: IconsaxPlusLinear.location,
          onTap: () {},
        ),
      ],
    );
  }
}
