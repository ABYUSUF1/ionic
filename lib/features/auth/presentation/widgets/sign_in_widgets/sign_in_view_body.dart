import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_widgets/sign_in_form.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (authEntity) {
            closeFullScreenLoading(context);

            // Maybe we come from another screen profile, checkout, ....
            // so we back to it again not from begin (home)
            if (context.canPop()) {
              context.read<AuthCubit>().updateUserData(authEntity);
              context.pop();
            } else {
              context.push(AppRouterName.homeRoute);
            }
          },
          error: (message) {
            closeFullScreenLoading(context);
            AppSnackbar.showErrorSnackBar(context, message);
          },
          emailNotVerified: () {
            closeFullScreenLoading(context);
            AppSnackbar.showSuccessSnackBar(
              context,
              "We sent you an email to verify your account.",
            );
            context.push(
              AppRouterName.emailSentRoute,
              extra: EmailSentArgs(
                isPasswordReset: false,
                email: context.read<SignInCubit>().emailController.text.trim(),
              ),
            );
          },
          loading: () => showFullScreenLoading(context, "Signing In..."),
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SignInForm(),
            ),
          ),
        ),
      ),
    );
  }
}
