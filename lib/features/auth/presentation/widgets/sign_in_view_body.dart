import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_underline_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

import '../../../../core/theme/app_colors.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                Text("Sign in", style: theme.textTheme.headlineLarge!),
                const SizedBox(height: 50),

                CustomFilledButton(
                  text: "Continue with Google",
                  buttonColor: theme.colorScheme.secondary,
                  textStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                  svgIcon: AppAssets.iconsGoogle,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(indent: 60, endIndent: 10)),
                    Text("or Sign in with", style: theme.textTheme.bodySmall),
                    Flexible(child: Divider(indent: 10, endIndent: 60)),
                  ],
                ),
                const SizedBox(height: 30),
                FormTextField(
                  title: "E-Mail Address",
                  hintText: "Enter your E-Mail",
                  prefixIcon: IconsaxPlusLinear.send_1,
                ),
                const SizedBox(height: 16),
                FormTextField(
                  title: "Password",
                  hintText: "********",
                  prefixIcon: IconsaxPlusLinear.key,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: CustomUnderlineButton(
                    text: "Forget Password?",
                    textStyle: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    onPressed:
                        () => context.push(AppRouterName.forgetPasswordRoute),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomFilledButton(text: "Sign in"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: CustomFilledButton(
                        text: "As Guest",
                        buttonColor: theme.colorScheme.secondary,
                        textStyle: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),

                GestureDetector(
                  onTap: () {
                    context.push(AppRouterName.signUpRoute);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: theme.textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Sign up",
                        style: TextStyle(color: AppColors.primaryColor),
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
