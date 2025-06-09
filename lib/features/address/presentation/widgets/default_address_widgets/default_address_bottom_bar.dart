import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../generated/locale_keys.g.dart';

class DefaultAddressBottomBar extends StatelessWidget {
  const DefaultAddressBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomFilledButton(
          text: context.tr(LocaleKeys.address_add_new_address),
          icon: IconsaxPlusLinear.location_add,
          onPressed: () {
            context.push(AppRouterName.locateOnMapRoute);
          },
        ),
      ),
    );
  }
}
