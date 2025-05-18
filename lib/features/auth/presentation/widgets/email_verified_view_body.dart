import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

import '../../../../core/widgets/buttons/custom_underline_button.dart';

class EmailVerifiedViewBody extends StatelessWidget {
  const EmailVerifiedViewBody({super.key});

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
              children: [
                Text("Verify Account", style: theme.textTheme.headlineLarge),
                const SizedBox(height: 5),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Code has been sent to "),
                      TextSpan(
                        text: "ym2250420@gmail.com",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(text: ". Please enter the code below."),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                FormTextField(title: "Enter Code", hintText: "4 digit code"),
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
                CustomFilledButton(text: "Verify Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
