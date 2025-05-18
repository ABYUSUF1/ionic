import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/buttons/custom_underline_button.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_view_body.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/widgets/buttons/custom_back_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
        actionsPadding: EdgeInsetsDirectional.only(end: 16),
        actions: [
          CustomUnderlineButton(
            text: "Skip now",
            color: theme.colorScheme.onSurfaceVariant,

            onPressed: () {
              context.go(AppRouterName.homeRoute);
            },
          ),
        ],
      ),
      body: SignInViewBody(),
    );
  }
}
