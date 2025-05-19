import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/views/email_sent_view.dart';
import 'package:ionic/features/auth/presentation/views/forget_password_view.dart';
import 'package:ionic/features/auth/presentation/views/sign_in_view.dart';
import 'package:ionic/features/auth/presentation/views/sign_up_view.dart';
import 'package:ionic/features/home/presentation/views/home_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouterName.homeRoute,
  routes: [
    GoRoute(
      path: AppRouterName.homeRoute,
      builder: (context, state) => const HomeView(),
    ),

    GoRoute(
      path: AppRouterName.signInRoute,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: AppRouterName.signUpRoute,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRouterName.forgetPasswordRoute,
      builder: (context, state) {
        final email = state.extra as String?;
        return ForgetPasswordView(email: email);
      },
    ),
    GoRoute(
      path: AppRouterName.emailSentRoute,
      builder: (context, state) {
        final data = state.extra as EmailSentArgs;
        return EmailSentView(emailSentArgs: data);
      },
    ),
  ],
);
