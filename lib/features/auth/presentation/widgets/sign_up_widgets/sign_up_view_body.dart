import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/manager/sign_up/sign_up_cubit.dart';

import '../../../../../core/widgets/loading/full_screen_loading.dart';
import '../../../../../core/widgets/snackbar/app_snackbar.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            closeFullScreenLoading(context);
            AppSnackbar.showSuccessSnackBar(
              context,
              LocaleKeys.auth_we_sent_you_an_email_to_verify_your_account.tr(),
            );
            context.push(
              AppRouterName.emailSentRoute,

              extra: EmailSentArgs(
                isPasswordReset: false,
                email: context.read<SignUpCubit>().emailController.text.trim(),
              ),
            );
          },
          error: (message) {
            closeFullScreenLoading(context);
            AppSnackbar.showErrorSnackBar(context, message);
          },
          loading:
              () => showFullScreenLoading(
                context,
                LocaleKeys.auth_creating_account.tr(),
              ),
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}
