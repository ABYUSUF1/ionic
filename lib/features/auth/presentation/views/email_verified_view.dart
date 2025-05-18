import 'package:flutter/material.dart';
import 'package:ionic/features/auth/presentation/widgets/email_verified_view_body.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';

class EmailVerifiedView extends StatelessWidget {
  const EmailVerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: EmailVerifiedViewBody(),
    );
  }
}
