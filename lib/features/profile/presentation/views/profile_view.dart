import 'package:flutter/material.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_app_bar_widgets/profile_app_bar.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_my_preference_box.dart';

import '../widgets/profile_widgets/log_out_button.dart';
import '../widgets/profile_widgets/profile_info_and_support_box.dart';
import '../widgets/profile_widgets/profile_settings_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        ProfileAppBar(),
        ProfileMyPreferenceBox(),
        ProfileSettingsBox(),
        ProfileInfoAndSupportBox(),
        LogOutButton(),
      ],
    );
  }
}
