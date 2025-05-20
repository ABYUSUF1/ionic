import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import '../../../../../auth/presentation/manager/auth/auth_cubit.dart';
import 'authenticated_profile_app_bar.dart';
import 'guest_profile_app_bar.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: (message) => showFullScreenLoading(context, message),
          error: (message) {
            closeFullScreenLoading(context);
            AppSnackbar.showErrorSnackBar(context, message);
          },
          orElse: () => closeFullScreenLoading(context),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          authenticated:
              (authEntity) =>
                  AuthenticatedProfileAppBar(authEntity: authEntity),
          orElse: () => const GuestProfileAppBar(),
        );
      },
    );
  }
}
