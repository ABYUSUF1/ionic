import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/custom_scaffold.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/profile/presentation/manager/cubit/edit_profile_cubit.dart';

import '../../../../core/widgets/loading/full_screen_loading.dart';
import '../../../../core/widgets/snackbar/app_snackbar.dart';
import '../widgets/edit_profile_widgets/edit_profile_save_button.dart';
import '../widgets/edit_profile_widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              EditProfileCubit(getIt())
                ..init(context.read<AuthCubit>().cachedAuthEntity!),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => showFullScreenLoading(context, "Save Changes..."),
            error: (message) {
              closeFullScreenLoading(context);
              AppSnackbar.showErrorSnackBar(context, message);
            },
            success: (authEntity) {
              context.read<AuthCubit>().updateUserData(authEntity);
              closeFullScreenLoading(context);
              AppSnackbar.showSuccessSnackBar(
                context,
                "Profile Updated Successfully.",
              );
            },
          );
        },
        builder: (context, state) {
          return CustomScaffold(
            body: EditProfileViewBody(),
            title: "Edit Profile",
            bottomSheet: EditProfileSaveButton(),
          );
        },
      ),
    );
  }
}
