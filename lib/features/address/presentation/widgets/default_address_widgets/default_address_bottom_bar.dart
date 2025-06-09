import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';

class DefaultAddressBottomBar extends StatelessWidget {
  const DefaultAddressBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomFilledButton(
          text: "Add New Address",
          icon: IconsaxPlusLinear.location_add,
          onPressed: () {
            context.push(AppRouterName.locateOnMapRoute);
          },
        ),
      ),
    );
  }
}
