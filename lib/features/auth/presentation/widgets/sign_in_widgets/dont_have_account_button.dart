import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/theme/app_colors.dart';

class DontHaveAccountButton extends StatelessWidget {
  const DontHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.push(AppRouterName.signUpRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${LocaleKeys.auth_dont_have_an_account.tr()} ",
            style: theme.textTheme.bodyMedium!.copyWith(),
          ),
          const SizedBox(width: 4),
          Text(
            LocaleKeys.auth_sign_up.tr(),
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
