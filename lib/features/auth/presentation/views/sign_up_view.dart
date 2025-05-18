import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/buttons/custom_back_button.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: CustomBackButton()),
      body: SignUpViewBody(),
    );
  }
}
