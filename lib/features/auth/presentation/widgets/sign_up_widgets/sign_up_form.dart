import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/validators.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../core/widgets/text_field/form_text_field.dart';
import '../../../../../core/widgets/text_field/password_text_field.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../manager/sign_up/sign_up_cubit.dart';

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
          Text(
            LocaleKeys.auth_sign_up.tr(),
            style: theme.textTheme.headlineLarge!,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FormTextField(
                  title: LocaleKeys.auth_first_name.tr(),
                  hintText: LocaleKeys.common_enter_your.tr(
                    args: [LocaleKeys.auth_first_name.tr()],
                  ),
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
                  title: LocaleKeys.auth_last_name.tr(),
                  hintText: LocaleKeys.common_enter_your.tr(
                    args: [LocaleKeys.auth_last_name.tr()],
                  ),
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
            title: LocaleKeys.auth_email.tr(),
            hintText: LocaleKeys.common_enter_your.tr(
              args: [LocaleKeys.auth_email.tr()],
            ),
            prefixIcon: IconsaxPlusLinear.send_1,
            controller: cubit.emailController,
            validator:
                (_) => Validators.validateEmail(cubit.emailController.text),
          ),
          const SizedBox(height: 16),
          FormTextField(
            title: LocaleKeys.auth_phone.tr(),
            hintText: LocaleKeys.common_enter_your.tr(
              args: [LocaleKeys.auth_phone.tr()],
            ),
            prefixIcon: IconsaxPlusLinear.call,
            controller: cubit.phoneNumberController,
            keyboardType: TextInputType.phone,
            validator:
                (_) =>
                    Validators.validatePhone(cubit.phoneNumberController.text),
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            title: LocaleKeys.auth_password.tr(),
            hintText: LocaleKeys.common_enter_your.tr(
              args: [LocaleKeys.auth_password.tr()],
            ),
            prefixIcon: IconsaxPlusLinear.key,
            controller: cubit.passwordController,
            validator:
                (_) =>
                    Validators.validatePassword(cubit.passwordController.text),
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            title: LocaleKeys.auth_confirm_password.tr(),
            hintText: LocaleKeys.common_enter_your.tr(
              args: [LocaleKeys.auth_confirm_password.tr()],
            ),
            prefixIcon: IconsaxPlusLinear.key,
            controller: cubit.confirmPasswordController,
            validator:
                (_) => Validators.validatePassword(
                  cubit.confirmPasswordController.text,
                ),
          ),
          const SizedBox(height: 50),
          CustomFilledButton(
            text: LocaleKeys.auth_create_account.tr(),
            onPressed: () async {
              await cubit.signUpWithEmailAndPassword();
            },
          ),
          const SizedBox(height: 50),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "${LocaleKeys.auth_by_continuing_you_agree_to_our.tr()} ",
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              children: [
                TextSpan(
                  text: LocaleKeys.auth_terms_of_service.tr(),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
                TextSpan(text: " ${LocaleKeys.common_and.tr()} "),
                TextSpan(
                  text: LocaleKeys.auth_privacy_policy.tr(),
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
