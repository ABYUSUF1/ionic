import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/profile/presentation/manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';
import 'package:ionic/features/profile/presentation/views/account_privacy_view.dart';
import 'package:ionic/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ionic/features/profile/presentation/views/notification_view.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../address/presentation/views/default_address_view.dart';
import 'profile_mobile_view.dart';

class ProfileTabletView extends StatelessWidget {
  const ProfileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => TabletUiLogic(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 310, child: ProfileMobileView()),
          Expanded(
            child: BlocBuilder<TabletUiLogic, ProfileButtonEnum?>(
              builder: (context, state) {
                if (state == null) {
                  return Center(
                    child: Text(
                      context.tr(LocaleKeys.profile_select_section),
                      style: theme.textTheme.headlineMedium,
                    ),
                  );
                }

                Widget child;
                switch (state) {
                  case ProfileButtonEnum.editProfile:
                    child = const EditProfileView();
                    break;
                  case ProfileButtonEnum.myAddresses:
                    child = const Padding(
                      padding: EdgeInsets.only(bottom: 16, right: 16, left: 16),
                      child: DefaultAddressView(),
                    );
                    break;
                  case ProfileButtonEnum.notifications:
                    child = const NotificationView();
                    break;
                  case ProfileButtonEnum.accountPrivacy:
                    child = const AccountPrivacyView();
                    break;
                }
                return FadeInDown(
                  from: 20,
                  duration: const Duration(milliseconds: 300),
                  key: ValueKey(state),
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
