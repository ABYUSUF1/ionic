import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_font.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../manager/save_address/save_address_cubit.dart';

class IsDefaultCheckbox extends StatelessWidget {
  const IsDefaultCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SaveAddressCubit>();
    final theme = Theme.of(context);
    return cubit.resolveIsDefault(context)
        ? Text(
          cubit.addressEntity.id.isNotEmpty
              ? context.tr(
                LocaleKeys.address_cannot_update_default_while_editing,
              )
              : context.tr(LocaleKeys.address_this_address_will_be_auto),
          style: TextStyle(
            color: theme.colorScheme.onSurfaceVariant,
            fontFamily: appFont(context),
          ),
        )
        : BlocBuilder<SaveAddressCubit, SaveAddressState>(
          builder: (context, state) {
            return CheckboxListTile(
              title: Text(context.tr(LocaleKeys.address_set_as_default)),
              controlAffinity: ListTileControlAffinity.leading,
              value: cubit.isDefault,
              onChanged: (value) {
                cubit.onDefaultChanged(value!);
              },
            );
          },
        );
  }
}
