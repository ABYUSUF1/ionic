import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/validators.dart';
import 'package:ionic/core/widgets/loading/normal_loading.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../core/widgets/text_field/form_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  final String? email;
  const ForgetPasswordForm({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final emailController = context.read<ForgetPasswordCubit>().emailController;
    emailController.text = email ?? '';
    final theme = Theme.of(context);

    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            AppSnackbar.showErrorSnackBar(context, message);
          },
          success: () {
            AppSnackbar.showSuccessSnackBar(
              context,
              LocaleKeys.auth_send_password_reset_link.tr(),
            );

            context.push(
              AppRouterName.emailSentRoute,
              extra: EmailSentArgs(
                isPasswordReset: true,
                email: emailController.text.trim(),
              ),
            );
          },
        );
      },
      child: Form(
        key: context.read<ForgetPasswordCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              LocaleKeys.auth_forgot_password.tr(),
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 5),
            Text(
              LocaleKeys.auth_forget_password_desc.tr(),
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 50),

            FormTextField(
              controller: emailController,
              title: LocaleKeys.auth_email.tr(),
              hintText: LocaleKeys.common_enter_your.tr(
                args: [LocaleKeys.auth_email.tr()],
              ),
              prefixIcon: IconsaxPlusLinear.send_1,
              validator: (_) => Validators.validateEmail(emailController.text),
            ),
            const SizedBox(height: 30),

            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: NormalLoading()),
                  orElse:
                      () => CustomFilledButton(
                        text: LocaleKeys.common_send.tr(),
                        onPressed: () async {
                          await context
                              .read<ForgetPasswordCubit>()
                              .sendPasswordReset();
                        },
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
