import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_form.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            closeFullScreenLoading(context);
            context.goNamed(AppRouterName.homeRoute);
          },
          error: (message) {
            closeFullScreenLoading(context);
            AppSnackbar.showErrorSnackBar(context, message);
          },
          emailNotVerified: () {
            closeFullScreenLoading(context);
            context.goNamed(AppRouterName.emailSentRoute);
          },
          loading: () => showFullScreenLoading(context),
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
