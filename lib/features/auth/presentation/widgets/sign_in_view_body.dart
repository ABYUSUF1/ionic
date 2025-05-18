import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/core/widgets/buttons/custom_underline_button.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
                Text("Sign In", style: theme.textTheme.headlineLarge!),
                const SizedBox(height: 50),
                FormTextField(
                  title: "E-Mail Address",
                  hintText: "Enter your E-Mail",
                ),
                const SizedBox(height: 16),
                FormTextField(title: "Password", hintText: "********"),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: CustomUnderlineButton(
                    text: "Forget Password?",
                    onPressed:
                        () => context.push(AppRouterName.forgetPasswordRoute),
                  ),
                ),
                const SizedBox(height: 50),
                CustomFilledButton(text: "Sign in"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    CustomUnderlineButton(
                      text: "Sign Up",
                      onPressed: () => context.push(AppRouterName.signUpRoute),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                Text("or Sign in with", style: theme.textTheme.bodySmall),
                const SizedBox(height: 16),
                CustomOutlineButton(
                  text: "Continue with Google",
                  svgIcon: AppAssets.iconsGoogle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
