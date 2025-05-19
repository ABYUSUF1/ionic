import 'package:flutter/material.dart';
import 'package:ionic/features/auth/presentation/widgets/forget_password_widgets/forget_password_form.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  final String? email;
  const ForgetPasswordViewBody({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ForgetPasswordForm(email: email),
          ),
        ),
      ),
    );
  }
}
