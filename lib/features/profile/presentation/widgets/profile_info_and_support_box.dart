import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'custom_profile_box.dart';
import 'custom_profile_list_tile.dart';

class ProfileInfoAndSupportBox extends StatelessWidget {
  const ProfileInfoAndSupportBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: "Information & Support",
      children: [
        CustomProfileListTile(
          title: "About Us",
          icon: IconsaxPlusLinear.people,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: "Help Center",
          icon: IconsaxPlusLinear.headphone,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: "Share App",
          icon: IconsaxPlusLinear.share,
          onTap: () {},
        ),
      ],
    );
  }
}
