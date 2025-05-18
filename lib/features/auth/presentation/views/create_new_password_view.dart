import 'package:flutter/material.dart';
import 'package:ionic/features/auth/presentation/widgets/create_new_password_view_body.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const CustomBackButton()),
      body: CreateNewPasswordViewBody(),
    );
  }
}
