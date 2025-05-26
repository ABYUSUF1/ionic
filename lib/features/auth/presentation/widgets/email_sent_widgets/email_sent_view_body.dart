import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../manager/email_sent/email_sent_cubit.dart';
import 'resend_button.dart';

class EmailSentViewBody extends StatelessWidget {
  final bool isPasswordReset;
  final String email;
  const EmailSentViewBody({
    super.key,
    required this.isPasswordReset,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Brightness.light == theme.brightness
                      ? AppAssets.illustrationsSendingIllustrationLight
                      : AppAssets.illustrationsSendingIllustrationDark,
                  width: 250,
                  height: 250,
                ),
                Text(
                  isPasswordReset
                      ? LocaleKeys.auth_password_reset.tr()
                      : LocaleKeys.auth_verify_email_address.tr(),
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 5),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${LocaleKeys.auth_we_have_sent_a_link_to.tr()} ",
                      ),
                      TextSpan(
                        text: email,
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(
                        text:
                            "\n${LocaleKeys.auth_please_check_your_email_for_the_link.tr()}",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                CustomFilledButton(
                  text: LocaleKeys.auth_back_to_login.tr(),
                  onPressed: () {
                    context.read<EmailSentCubit>().handleEmailVerificationPop(
                      context,
                      theme,
                    );
                  },
                ),
                const SizedBox(height: 50),
                ResendButton(email: email, isPasswordReset: isPasswordReset),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
