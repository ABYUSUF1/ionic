import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/language_widgets/language_switcher.dart';
import 'package:ionic/features/auth/domain/repo/auth_repo.dart';
import 'package:ionic/features/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_in_widgets/sign_in_view_body.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
        actionsPadding: EdgeInsetsDirectional.only(end: 16),
        actions: [LanguageSwitcher()],
      ),
      body: BlocProvider(
        create: (context) => SignInCubit(getIt<AuthRepo>()),
        child: SignInViewBody(),
      ),
    );
  }
}
