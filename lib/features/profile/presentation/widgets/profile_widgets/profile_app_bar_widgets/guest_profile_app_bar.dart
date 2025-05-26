import 'package:flutter/material.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_widgets/profile_app_bar_widgets/profile_guest_app_bar_sign_button.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/app_assets.dart';

class GuestProfileAppBar extends StatelessWidget {
  const GuestProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 265,
      elevation: 5,
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surface,
      shadowColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.all(16),
          color: theme.colorScheme.surface,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGuestHeader(theme),
                const SizedBox(height: 16),
                const ProfileGuestAppBarSignButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGuestHeader(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.secondary,
          radius: 35,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
            child: Lottie.asset(
              AppAssets.lottiesGuestProfileAnimation,
              width: 45,
              height: 45,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ListTile(
            title: Text(
              "Welcome to Ionic",
              style: theme.textTheme.headlineMedium,
            ),
            subtitle: Text(
              "For more features, sign in.",
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
