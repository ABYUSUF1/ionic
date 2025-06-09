import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/save_address/save_address_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class AddressType extends StatelessWidget {
  const AddressType({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SaveAddressCubit, SaveAddressState>(
      builder: (context, state) {
        final cubit = context.read<SaveAddressCubit>();
        final selectedOption = cubit.selectedAddressType;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr(LocaleKeys.address_type),
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _customChip(context, selectedOption, theme, AddressEnum.home),
                const SizedBox(width: 12),
                _customChip(context, selectedOption, theme, AddressEnum.work),
                const SizedBox(width: 12),
                _customChip(context, selectedOption, theme, AddressEnum.other),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _customChip(
    BuildContext context,
    AddressEnum selectedOption,
    ThemeData theme,
    AddressEnum type,
  ) {
    return ChoiceChip(
      label: Text(type.label),
      selected: selectedOption == type,
      side: BorderSide.none,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color:
            selectedOption == type
                ? Colors.white
                : theme.colorScheme.onSurfaceVariant,
      ),
      checkmarkColor: Colors.white,
      selectedColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.secondary,
      onSelected: (_) {
        context.read<SaveAddressCubit>().onAddressTypeChanged(type);
      },
    );
  }
}
