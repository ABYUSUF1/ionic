import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                  prefixIcon: IconsaxPlusLinear.send_1,
                ),
                const SizedBox(height: 30),

                CustomFilledButton(
                  text: "Send",
                  onPressed: () {
                    context.push(
                      AppRouterName.emailSentRoute,
                      extra: "Password Reset Email Sent",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
