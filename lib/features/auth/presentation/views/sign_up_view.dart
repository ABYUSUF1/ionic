import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/buttons/custom_back_button.dart';
import 'package:ionic/features/auth/presentation/widgets/sign_up_widgets/sign_up_view_body.dart';

import '../../domain/repo/auth_repo.dart';
import '../manager/sign_up/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt<AuthRepo>()),
        child: const SignUpViewBody(),
      ),
    );
  }
}
