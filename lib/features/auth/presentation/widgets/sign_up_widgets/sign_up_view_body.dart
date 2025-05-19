import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/manager/sign_up/sign_up_cubit.dart';

import '../../../../../core/widgets/loading/full_screen_loading.dart';
import '../../../../../core/widgets/snackbar/app_snackbar.dart';
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
              "We sent you an email to verify your account.",
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
          loading: () => showFullScreenLoading(context, "Creating Account..."),
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
