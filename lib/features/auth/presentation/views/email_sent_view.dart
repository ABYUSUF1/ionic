import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/features/auth/presentation/widgets/email_sent_widgets/email_sent_view_body.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../../domain/repo/auth_repo.dart';
import '../manager/email_sent/email_sent_cubit.dart';

class EmailSentView extends StatelessWidget {
  final String email;
  final bool isPasswordReset;

  const EmailSentView({
    super.key,
    required this.email,
    required this.isPasswordReset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => EmailSentCubit(getIt<AuthRepo>()),
      child: Builder(
        // <- This gives us a new context below the BlocProvider
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              debugPrint("Pop invoked: $didPop");
              if (isPasswordReset) {
                context.pushReplacement(AppRouterName.signInRoute);
              } else {
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
                    if (isPasswordReset) {
                      context.pushReplacement(AppRouterName.signInRoute);
                    } else {
                      context.read<EmailSentCubit>().handleEmailVerificationPop(
                        context,
                        theme,
                      );
                    }
                  },
                ),
                automaticallyImplyLeading: false,
              ),
              body: EmailSentViewBody(
                isPasswordReset: isPasswordReset,
                email: email,
              ),
            ),
          );
        },
      ),
    );
  }
}
