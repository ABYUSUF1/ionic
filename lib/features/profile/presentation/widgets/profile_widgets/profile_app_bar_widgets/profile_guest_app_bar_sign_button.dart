import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/widgets/buttons/custom_outline_button.dart';

class ProfileGuestAppBarSignButton extends StatelessWidget {
  const ProfileGuestAppBarSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlineButton(
          text: "Sign In / Sign Up",
          onPressed: () {
            context.push(AppRouterName.signInRoute);
          },
        ),
        const SizedBox(height: 12),
        CustomOutlineButton(
          text: "Continue with Google",
          onPressed: () async {
            await context.read<AuthCubit>().signInWithGoogle();
          },
          svgIcon: AppAssets.iconsGoogle,
        ),
      ],
    );
  }
}
