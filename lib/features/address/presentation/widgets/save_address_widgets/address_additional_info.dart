import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/address/presentation/manager/save_address/save_address_cubit.dart';

class AddressAdditionalInformation extends StatelessWidget {
  const AddressAdditionalInformation({super.key});

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
            Text("Address Type (Optional)", style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                _customChip(context, selectedOption, theme, 'Home'),
                const SizedBox(width: 12),
                _customChip(context, selectedOption, theme, 'Work'),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _customChip(
    BuildContext context,
    String selectedOption,
    ThemeData theme,
    String type,
  ) {
    return ChoiceChip(
      label: Text(type),
      selected: selectedOption == type,
      side: BorderSide.none,
      selectedColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.secondary,
      onSelected: (_) {
        context.read<SaveAddressCubit>().onAddressTypeChanged(type);
      },
    );
  }
}
