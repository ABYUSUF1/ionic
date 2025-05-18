import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

import '../../../../core/widgets/buttons/custom_underline_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.01,
          right: 16,
          left: 16,
          bottom: 16,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forget Password?", style: theme.textTheme.headlineLarge),
                const SizedBox(height: 5),
                Text(
                  "No worries! Enter your email address below and we will send you a code to reset password.",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 50),
                FormTextField(
                  title: "E-Mail Address",
                  hintText: "Enter your E-Mail",
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    CustomUnderlineButton(text: "Resend"),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Resend in 1:30",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomFilledButton(text: "Send Code"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
