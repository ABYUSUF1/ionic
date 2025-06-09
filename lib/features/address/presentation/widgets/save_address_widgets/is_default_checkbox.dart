import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_font.dart';

import '../../manager/save_address/save_address_cubit.dart';

class IsDefaultCheckbox extends StatelessWidget {
  const IsDefaultCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SaveAddressCubit>();
    final theme = Theme.of(context);
    return cubit.resolveIsDefault(context)
        ? Text(
          "This address will be automatically set as your default since it's your only address.",
          style: TextStyle(
            color: theme.colorScheme.onSurfaceVariant,
            fontFamily: appFont(context),
          ),
        )
        : BlocBuilder<SaveAddressCubit, SaveAddressState>(
          builder: (context, state) {
            return CheckboxListTile(
              title: const Text("Set as default address"),
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
