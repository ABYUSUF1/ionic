import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomOutlineButton(
          text: "Logout",
          color: theme.colorScheme.error,
          icon: IconsaxPlusLinear.logout,
          onPressed: () {},
        ),
      ),
    );
  }
}
