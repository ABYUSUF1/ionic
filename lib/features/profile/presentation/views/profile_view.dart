import 'package:flutter/material.dart';
import 'package:ionic/features/profile/presentation/widgets/profile_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        ProfileAppBar(),
        const SizedBox(height: 16),
        SliverToBoxAdapter(child: const SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Container(
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.all(16),
            child: Column(children: const [Text('Profile')]),
          ),
        ),
      ],
    );
  }
}
