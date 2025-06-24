import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

import '../widgets/profile_widgets/profile_mobile_view.dart';
import '../widgets/profile_widgets/profile_tablet_view.dart';

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
