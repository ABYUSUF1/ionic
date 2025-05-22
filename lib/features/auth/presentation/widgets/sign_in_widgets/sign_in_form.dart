import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_widgets/dont_have_account_button.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_widgets/guest_button.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../core/widgets/buttons/custom_underline_button.dart';
import '../../../../../core/widgets/text_field/form_text_field.dart';
import '../../../../../core/widgets/text_field/password_text_field.dart';
import '../../manager/sign_in/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.auth_sign_in.tr(),
            style: theme.textTheme.headlineLarge!,
          ),
          const SizedBox(height: 50),

          CustomFilledButton(
            text: LocaleKeys.auth_continue_with_google.tr(),
            buttonColor: theme.colorScheme.secondary,
            textStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
            svgIcon: AppAssets.iconsGoogle,
            onPressed: () async => await cubit.signInWithGoogle(),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Divider(indent: 60, endIndent: 10)),
              Text(
                LocaleKeys.auth_or_sign_in_with.tr(),
                style: theme.textTheme.bodySmall,
              ),
              Flexible(child: Divider(indent: 10, endIndent: 60)),
            ],
          ),
          const SizedBox(height: 30),
          FormTextField(
            controller: cubit.emailController,
            title: LocaleKeys.auth_email.tr(),
            hintText: LocaleKeys.common_enter_your.tr(
              args: [LocaleKeys.auth_email.tr()],
            ),
            prefixIcon: IconsaxPlusLinear.send_1,
            validator:
                (_) =>
                    Validators.validateEmail(cubit.emailController.text.trim()),
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            controller: cubit.passwordController,
            title: LocaleKeys.auth_password.tr(),
            hintText: "********",
            prefixIcon: IconsaxPlusLinear.key,
            validator:
                (_) => Validators.validatePassword(
                  cubit.passwordController.text.trim(),
                ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomUnderlineButton(
              text: LocaleKeys.auth_forgot_password.tr(),
              textStyle: theme.textTheme.bodySmall!.copyWith(
                color: AppColors.primaryColor,
              ),
              onPressed:
                  () => context.push(
                    AppRouterName.forgetPasswordRoute,
                    extra: cubit.emailController.text.trim(),
                  ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomFilledButton(
                  text: LocaleKeys.auth_sign_in.tr(),
                  onPressed: () async {
                    await cubit.signInWithEmailAndPassword();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(flex: 3, child: GuestButton()),
            ],
          ),
          SizedBox(height: size.height * 0.04),

          DontHaveAccountButton(),
        ],
      ),
    );
  }
}
