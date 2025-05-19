import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/validators.dart';
import '../../../../core/routing/app_router_name.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../core/widgets/text_field/form_text_field.dart';
import '../../../../core/widgets/text_field/password_text_field.dart';
import '../manager/sign_up/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
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
                  controller: cubit.firstNameController,
                  validator:
                      (_) => Validators.validateName(
                        cubit.firstNameController.text,
                      ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FormTextField(
                  title: "Last Name",
                  hintText: "Last Name",
                  prefixIcon: IconsaxPlusLinear.profile,
                  controller: cubit.lastNameController,
                  validator:
                      (_) => Validators.validateName(
                        cubit.lastNameController.text,
                      ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          FormTextField(
            title: "E-Mail Address",
            hintText: "Enter your E-Mail",
            prefixIcon: IconsaxPlusLinear.send_1,
            controller: cubit.emailController,
            validator:
                (_) => Validators.validateEmail(cubit.emailController.text),
          ),
          const SizedBox(height: 16),
          FormTextField(
            title: "Phone Number",
            hintText: "Enter your Phone",
            prefixIcon: IconsaxPlusLinear.call,
            controller: cubit.phoneNumberController,
            validator:
                (_) =>
                    Validators.validatePhone(cubit.phoneNumberController.text),
          ),
          const SizedBox(height: 16),
          FormTextField(
            title: "Password",
            hintText: "********",
            prefixIcon: IconsaxPlusLinear.key,
            controller: cubit.passwordController,
            validator:
                (_) =>
                    Validators.validatePassword(cubit.passwordController.text),
          ),
          const SizedBox(height: 16),

          PasswordTextField(
            title: "Confirm Password",
            hintText: "********",
            prefixIcon: IconsaxPlusLinear.key,
            controller: cubit.confirmPasswordController,
            validator:
                (_) => Validators.validatePassword(
                  cubit.confirmPasswordController.text,
                ),
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
    );
  }
}
