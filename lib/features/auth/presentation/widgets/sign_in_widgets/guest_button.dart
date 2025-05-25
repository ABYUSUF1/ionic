import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../core/widgets/dialog/custom_dialog.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomFilledButton(
      text: LocaleKeys.auth_as_guest.tr(),
      buttonColor: theme.colorScheme.secondary,
      textStyle: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurface,
      ),
      onPressed: () {
        showCustomDialog(
          context: context,
          title: "Sign in as guest",
          subTitle: "You will able to view products only.",
          svgPic:
              theme.brightness == Brightness.light
                  ? AppAssets.illustrationsLoginIllustrationLight
                  : AppAssets.illustrationsLoginIllustrationDark,
          buttonText: "Skip for now",
          onTap: () {
            context.go(AppRouterName.homeRoute);
          },
        );
      },
    );
  }
}
