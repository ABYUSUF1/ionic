import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../core/widgets/text_field/form_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign Up", style: theme.textTheme.headlineLarge!),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FormTextField(
                        title: "First Name",
                        hintText: "First Name",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FormTextField(
                        title: "Last Name",
                        hintText: "Last Name",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                FormTextField(
                  title: "E-Mail Address",
                  hintText: "Enter your E-Mail",
                ),
                const SizedBox(height: 16),
                FormTextField(title: "Password", hintText: "********"),
                const SizedBox(height: 16),
                FormTextField(title: "Confirm Password", hintText: "********"),

                const SizedBox(height: 50),
                CustomFilledButton(text: "Create Account"),
                const SizedBox(height: 16),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "By continuing, you agree to our ",
                    style: theme.textTheme.bodyMedium,
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
