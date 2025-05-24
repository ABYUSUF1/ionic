import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileSaveButton extends StatelessWidget {
  const EditProfileSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<EditProfileCubit>();
    final editProfileCubit = context.read<EditProfileCubit>();
    final canSubmit = cubit.state.maybeWhen(
      initial: (value, _) => value,
      orElse: () => false,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomFilledButton(
        text: LocaleKeys.common_save.tr(),
        textStyle: theme.textTheme.bodyMedium!.copyWith(
          color: canSubmit ? Colors.white : theme.colorScheme.onSurfaceVariant,
        ),
        buttonColor:
            canSubmit ? theme.colorScheme.primary : theme.colorScheme.secondary,
        onPressed: canSubmit ? () => editProfileCubit.saveChanges() : null,
      ),
    );
  }
}
