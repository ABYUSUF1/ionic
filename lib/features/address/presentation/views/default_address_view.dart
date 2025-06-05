import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/theme/app_colors.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../widgets/address_upper.dart';
import '../widgets/address_user_info.dart';

class DefaultAddressView extends StatelessWidget {
  const DefaultAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Default Address")),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add new address button
              TextButton.icon(
                onPressed: () {
                  context.push(AppRouterName.locateOnMapRoute);
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
                label: Text(
                  "Add New Address",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(IconsaxPlusLinear.location_add, size: 24),
              ),
              CustomFilledButton(text: "Set as Default", onPressed: () {}),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 30,
          children: [
            // Address list
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AddressUpper(), Divider(), AddressUserInfo()],
                    ),
                  );
                },
              ),
            ),

            // Confirm button
          ],
        ),
      ),
    );
  }
}
