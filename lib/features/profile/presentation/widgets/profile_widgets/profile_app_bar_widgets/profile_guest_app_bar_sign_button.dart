import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/widgets/buttons/custom_outline_button.dart';

class ProfileGuestAppBarSignButton extends StatelessWidget {
  const ProfileGuestAppBarSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlineButton(
          text: context.tr(LocaleKeys.common_sign_in_up),
          onPressed: () {
            context.push(AppRouterName.signInRoute);
          },
        ),
        const SizedBox(height: 12),
        CustomOutlineButton(
          text: context.tr(LocaleKeys.auth_continue_with_google),
          onPressed: () async {
            await context.read<AuthCubit>().signInWithGoogle(context);
          },
          svgIcon: AppAssets.iconsGoogle,
        ),
      ],
    );
  }
}
