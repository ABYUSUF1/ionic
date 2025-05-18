import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: ForgetPasswordViewBody(),
    );
  }
}
