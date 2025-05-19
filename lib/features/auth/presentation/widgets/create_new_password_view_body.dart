import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.04,
          right: 16,
          left: 16,
          bottom: 16,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create new password",
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  "Please enter and confirm your new password.\nYou will need to login after you reset.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 50),
                // FormTextField(title: "New Password", hintText: "*********"),
                const SizedBox(height: 16),
                // FormTextField(title: "Confirm Password", hintText: "*********"),
                const SizedBox(height: 100),
                CustomFilledButton(text: "Reset Password"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
