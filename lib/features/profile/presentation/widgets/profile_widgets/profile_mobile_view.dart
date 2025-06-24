import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_app_bar_widgets/profile_app_bar.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_my_preference_box.dart';

import 'package:flutter/material.dart';

import 'log_out_button.dart';
import 'profile_info_and_support_box.dart';
import 'profile_settings_box.dart';

class ProfileMobileView extends StatelessWidget {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ProfileAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 8)),
        ProfileMyPreferenceBox(),
        ProfileSettingsBox(),
        ProfileInfoAndSupportBox(),
        LogOutButton(),
      ],
    );
  }
}
