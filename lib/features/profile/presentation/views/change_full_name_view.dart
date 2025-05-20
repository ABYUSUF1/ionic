import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/utils/validators.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/profile/domain/repo/edit_profile_repo.dart';
import 'package:ionic/features/profile/presentation/manager/cubit/change_full_name_cubit.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../../../../core/widgets/snackbar/app_snackbar.dart';

class ChangeFullNameView extends StatelessWidget {
  const ChangeFullNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final theme = Theme.of(context);
    return BlocProvider(
      create:
          (context) => ChangeFullNameCubit(getIt<EditProfileRepo>())..init(
            authCubit.cachedAuthEntity!.firstName,
            authCubit.cachedAuthEntity!.lastName,
          ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const CustomBackButton(),
              const SizedBox(width: 16),
              Text("Change Full Name", style: theme.textTheme.headlineMedium),
            ],
          ),
        ),
        body: BlocConsumer<ChangeFullNameCubit, ChangeFullNameState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                closeFullScreenLoading(context);
                AppSnackbar.showErrorSnackBar(context, message);
              },
              loading: () => showFullScreenLoading(context, "Saving..."),
              success: () {
                authCubit.updateUserData(
                  authCubit.cachedAuthEntity!.copyWith(
                    firstName:
                        context
                            .read<ChangeFullNameCubit>()
                            .firstNameController
                            .text,
                    lastName:
                        context
                            .read<ChangeFullNameCubit>()
                            .lastNameController
                            .text,
                  ),
                );
                closeFullScreenLoading(context);
                AppSnackbar.showSuccessSnackBar(context, "Change Name Success");
              },
              orElse: () => null,
            );
          },
          builder: (context, state) {
            final editCubit = context.read<ChangeFullNameCubit>();
            final canSubmit = state.maybeWhen(
              initial: (canSubmit) => canSubmit,
              orElse: () => false,
            );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: editCubit.changeNameKey,
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      "Use real name for easy verification. This name will appear in many several pages",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    FormTextField(
                      title: "First Name",
                      controller: editCubit.firstNameController,
                      prefixIcon: IconsaxPlusLinear.profile,
                      validator:
                          (_) => Validators.validateName(
                            editCubit.firstNameController.text,
                          ),
                    ),
                    FormTextField(
                      title: "Last Name",
                      controller: editCubit.lastNameController,
                      prefixIcon: IconsaxPlusLinear.profile,
                      validator:
                          (_) => Validators.validateName(
                            editCubit.lastNameController.text,
                          ),
                    ),
                    CustomFilledButton(
                      text: "Save Changes",
                      onPressed:
                          canSubmit
                              ? () => editCubit.saveChanges(
                                authCubit.cachedAuthEntity!.copyWith(
                                  firstName:
                                      context
                                          .read<ChangeFullNameCubit>()
                                          .firstNameController
                                          .text,
                                  lastName:
                                      context
                                          .read<ChangeFullNameCubit>()
                                          .lastNameController
                                          .text,
                                ),
                              )
                              : null,
                      buttonColor:
                          canSubmit
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurfaceVariant.withValues(
                                alpha: .2,
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
