import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/widgets/email_sent_widgets/email_sent_view_body.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../../domain/repo/auth_repo.dart';
import '../manager/email_sent/email_sent_cubit.dart';

class EmailSentView extends StatelessWidget {
  final EmailSentArgs emailSentArgs;

  const EmailSentView({super.key, required this.emailSentArgs});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => EmailSentCubit(getIt<AuthRepo>()),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (emailSentArgs.isPasswordReset) {
            context.pushReplacement(AppRouterName.signInRoute);
            return;
          }

          if (!didPop) {
            context.read<EmailSentCubit>().handleEmailVerificationPop(
              context,
              theme,
            );
          }
        },

        child: Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: CustomBackButton(
              onPressed: () {
                if (!emailSentArgs.isPasswordReset) {
                  context.read<EmailSentCubit>().handleEmailVerificationPop(
                    context,
                    theme,
                  );
                } else {
                  context.pushReplacement(AppRouterName.signInRoute);
                }
              },
            ),
            automaticallyImplyLeading: false,
          ),

          body: EmailSentViewBody(
            isPasswordReset: emailSentArgs.isPasswordReset,
            email: emailSentArgs.email,
          ),
        ),
      ),
    );
  }
}
