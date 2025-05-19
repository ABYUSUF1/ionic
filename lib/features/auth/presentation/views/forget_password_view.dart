import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/di/get_it_service.dart';
import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../../domain/repo/auth_repo.dart';
import '../manager/forget_password/forget_password_cubit.dart';
import '../widgets/forget_password_widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  final String? email;
  const ForgetPasswordView({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
        child: ForgetPasswordViewBody(email: email),
      ),
    );
  }
}
