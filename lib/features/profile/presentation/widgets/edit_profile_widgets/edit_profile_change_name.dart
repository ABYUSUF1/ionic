import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/validators.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileChangeName extends StatelessWidget {
  const EditProfileChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final editCubit = context.read<EditProfileCubit>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        final firstNameField = FormTextField(
          title: LocaleKeys.auth_first_name.tr(),
          controller: editCubit.firstNameController,
          prefixIcon: IconsaxPlusLinear.profile,
          onChanged: (_) => editCubit.onNameChanged(),
          validator:
              (_) =>
                  Validators.validateName(editCubit.firstNameController.text),
        );

        final lastNameField = FormTextField(
          title: LocaleKeys.auth_last_name.tr(),
          controller: editCubit.lastNameController,
          prefixIcon: IconsaxPlusLinear.profile,
          onChanged: (_) => editCubit.onNameChanged(),
          validator:
              (_) => Validators.validateName(editCubit.lastNameController.text),
        );

        return isWide
            ? Row(
              children: [
                Expanded(child: firstNameField),
                const SizedBox(width: 16),
                Expanded(child: lastNameField),
              ],
            )
            : Column(
              children: [
                firstNameField,
                const SizedBox(height: 16),
                lastNameField,
              ],
            );
      },
    );
  }
}
