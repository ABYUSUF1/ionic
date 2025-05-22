import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/snackbar/app_snackbar.dart';
import '../../manager/email_sent/email_sent_cubit.dart';

class ResendButton extends StatelessWidget {
  final String email;
  final bool isPasswordReset;

  const ResendButton({
    super.key,
    required this.email,
    required this.isPasswordReset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<EmailSentCubit, EmailSentState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            AppSnackbar.showErrorSnackBar(context, message);
          },
          inProgress: (message) {
            AppSnackbar.showSuccessSnackBar(context, message);
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<EmailSentCubit>();

        final bool isCooldown = state.maybeWhen(
          coolDown: (_) => true,
          orElse: () => false,
        );

        final int secondsRemaining = state.maybeWhen(
          coolDown: (seconds) => seconds,
          orElse: () => 0,
        );

        final bool isLoading = state.maybeWhen(
          inProgress: (_) => true,
          orElse: () => false,
        );

        final String buttonText =
            isCooldown
                ? '${LocaleKeys.auth_you_can_resend_after} ${secondsRemaining}s'
                : isLoading
                ? LocaleKeys.common_sending.tr()
                : LocaleKeys.common_resend.tr();

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.auth_didnt_receive_the_email.tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            CustomOutlineButton(
              text: buttonText,
              color: AppColors.primaryColor,
              onPressed:
                  isCooldown || isLoading
                      ? null
                      : () => cubit.resendEmail(email, isPasswordReset),
            ),
          ],
        );
      },
    );
  }
}
