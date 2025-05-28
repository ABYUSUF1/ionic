import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/text_field/form_text_field.dart';
import '../../../../auth/presentation/manager/auth/auth_cubit.dart';
import '../../manager/cubit/edit_profile_cubit.dart';
import 'custom_edit_profile_box.dart';
import 'delete_account_button.dart';
import 'edit_profile_change_gender_birth_date.dart';
import 'edit_profile_change_name.dart';
import 'edit_profile_image.dart';
import 'edit_profile_save_button.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Form(
              key: editProfileCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditProfileImage(),
                  const SizedBox(height: 30),
                  CustomEditProfileBox(
                    title: LocaleKeys.edit_profile_personal_info.tr(),
                    child: Column(
                      spacing: 20,
                      children: [
                        FormTextField(
                          title: LocaleKeys.auth_email.tr(),
                          controller: editProfileCubit.emailController,
                          prefixIcon: IconsaxPlusLinear.send_1,
                          readOnly: true,
                        ),
                        const EditProfileChangeName(),
                        FormTextField(
                          title: LocaleKeys.auth_phone.tr(),
                          controller: editProfileCubit.phoneNumberController,
                          prefixIcon: IconsaxPlusLinear.call,
                          onChanged: (_) => editProfileCubit.onPhoneChanged(),
                          validator:
                              (_) => Validators.validatePhone(
                                editProfileCubit.phoneNumberController.text,
                              ),
                        ),
                        const EditProfileGenderBirthdate(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const DeleteAccountButton(),

                  if (!ResponsiveLayout.isMobile(context)) ...[
                    const SizedBox(height: 30),
                    const EditProfileSaveButton(),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
