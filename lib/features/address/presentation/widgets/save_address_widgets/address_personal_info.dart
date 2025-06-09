import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/utils/validators.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/widgets/text_field/form_text_field.dart';
import '../../manager/save_address/save_address_cubit.dart';

class AddressPersonalInformation extends StatelessWidget {
  const AddressPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SaveAddressCubit>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: FormTextField(
                  title: context.tr(LocaleKeys.auth_first_name),
                  controller: cubit.firstNameController,
                  validator:
                      (_) => Validators.validateName(
                        cubit.firstNameController.text,
                      ),
                ),
              ),
              Expanded(
                child: FormTextField(
                  title: context.tr(LocaleKeys.auth_last_name),
                  controller: cubit.lastNameController,
                  validator:
                      (_) => Validators.validateName(
                        cubit.lastNameController.text,
                      ),
                ),
              ),
            ],
          ),
          FormTextField(
            title: context.tr(LocaleKeys.auth_phone),
            controller: cubit.phoneNumberController,
            validator:
                (_) =>
                    Validators.validatePhone(cubit.phoneNumberController.text),
          ),
        ],
      ),
    );
  }
}
