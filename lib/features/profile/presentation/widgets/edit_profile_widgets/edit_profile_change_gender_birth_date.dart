import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileGenderBirthdate extends StatelessWidget {
  const EditProfileGenderBirthdate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        final theme = Theme.of(context);

        final birthdate = state.maybeWhen(
          initial: (_, authEntity) => authEntity?.birthDate,
          orElse: () => cubit.birthdate,
        );

        final gender = state.maybeWhen(
          initial: (_, authEntity) => authEntity?.gender,
          orElse: () => cubit.gender,
        );

        final birthdateText =
            birthdate != null
                ? "${birthdate.day.toString().padLeft(2, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.year}"
                : '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTextField(
              title: LocaleKeys.edit_profile_birth_date.tr(),
              controller: TextEditingController(text: birthdateText),
              onTap: () => _pickDate(context),
              hintText: "DD-MM-YYYY",
              prefixIcon: IconsaxPlusLinear.calendar,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  IconsaxPlusLinear.profile_2user,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 16),
                Text(
                  LocaleKeys.edit_profile_gender.tr(),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                _buildGenderButton(
                  context,
                  LocaleKeys.edit_profile_gender_male.tr(),
                  gender,
                ),
                const SizedBox(width: 16),
                _buildGenderButton(
                  context,
                  LocaleKeys.edit_profile_gender_female.tr(),
                  gender,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildGenderButton(
    BuildContext context,
    String gender,
    String? selectedGender,
  ) {
    final cubit = context.read<EditProfileCubit>();
    final isSelected = selectedGender == gender;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 400),
      child: OutlinedButton(
        onPressed: () {
          cubit.gender = gender;
          cubit.onGenderChanged();
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : null,
          foregroundColor: isSelected ? Colors.white : null,
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        child: Text(gender),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final cubit = context.read<EditProfileCubit>();
    final now = DateTime.now();
    final initialDate = cubit.birthdate ?? DateTime(now.year - 20);

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (date != null) {
      cubit.birthdate = date;
      cubit.onBirthDateChanged();
    }
  }
}
