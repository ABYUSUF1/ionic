import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/profile/presentation/manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';
import 'package:ionic/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_app_bar_widgets/profile_app_bar.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_my_preference_box.dart';

import '../widgets/profile_widgets/log_out_button.dart';
import '../widgets/profile_widgets/profile_info_and_support_box.dart';
import '../widgets/profile_widgets/profile_settings_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletChild: ProfileTabletView(),
      mobileChild: ProfileMobileView(),
    );
  }
}

class ProfileTabletView extends StatelessWidget {
  const ProfileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabletUiLogic(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 300, child: ProfileMobileView()),
          Expanded(
            child: BlocBuilder<TabletUiLogic, ProfileButtonEnum?>(
              builder: (context, state) {
                if (state == null) {
                  return const Center(child: Text('Select a section'));
                }

                Widget child;
                switch (state) {
                  case ProfileButtonEnum.editProfile:
                    child = const EditProfileView();
                    break;
                  case ProfileButtonEnum.myOrders:
                    child = const Text("Orders View");
                    break;
                  case ProfileButtonEnum.myAddresses:
                    child = const Text("address View");
                    break;
                  case ProfileButtonEnum.notifications:
                    child = const Text("Notifications View");
                    break;
                  case ProfileButtonEnum.accountPrivacy:
                    child = const Text("Privacy View");
                    break;
                }
                return FadeInDown(
                  from: 20,
                  duration: const Duration(milliseconds: 300),
                  key: UniqueKey(),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
