import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';

import '../../../../core/routing/app_router_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomOutlineButton(
          text: "GO TO Auth",
          onPressed: () {
            context.push(AppRouterName.signInRoute);
          },
        ),
      ),
    );
  }
}
