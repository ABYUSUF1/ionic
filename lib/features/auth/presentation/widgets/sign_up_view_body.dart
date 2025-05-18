import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/routing/app_router_name.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../core/widgets/text_field/form_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up", style: theme.textTheme.headlineLarge!),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FormTextField(
                        title: "First Name",
                        hintText: "First Name",
                        prefixIcon: IconsaxPlusLinear.profile,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FormTextField(
                        title: "Last Name",
                        hintText: "Last Name",
                        prefixIcon: IconsaxPlusLinear.profile,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                FormTextField(
                  title: "E-Mail Address",
                  hintText: "Enter your E-Mail",
                  prefixIcon: IconsaxPlusLinear.send_1,
                ),
                const SizedBox(height: 16),
                FormTextField(
                  title: "Phone",
                  hintText: "Enter your Phone",
                  prefixIcon: IconsaxPlusLinear.call,
                ),
                const SizedBox(height: 16),
                FormTextField(
                  title: "Password",
                  hintText: "********",
                  prefixIcon: IconsaxPlusLinear.key,
                ),
                const SizedBox(height: 16),
                FormTextField(
                  title: "Confirm Password",
                  hintText: "********",
                  prefixIcon: IconsaxPlusLinear.key,
                ),

                const SizedBox(height: 50),
                CustomFilledButton(
                  text: "Create Account",
                  onPressed: () {
                    context.push(
                      AppRouterName.emailSentRoute,
                      extra: "Verify E-Mail Address",
                    );
                  },
                ),
                const SizedBox(height: 50),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "By continuing, you agree to our ",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),

                    children: [
                      TextSpan(
                        text: "Terms of service",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
