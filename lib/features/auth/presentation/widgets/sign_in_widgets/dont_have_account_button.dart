import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            "Don't have an account? ",
            style: theme.textTheme.bodyMedium!.copyWith(),
          ),
          const SizedBox(width: 4),
          Text("Sign up", style: TextStyle(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
