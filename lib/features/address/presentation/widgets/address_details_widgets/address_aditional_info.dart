import 'package:flutter/material.dart';

class AddressAdditionalInformation extends StatelessWidget {
  const AddressAdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StatefulBuilder(
      builder: (context, setState) {
        String selectedOption = 'Home'; // default is 'home'

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Address Type (Optional)", style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                _customChip(selectedOption, theme, setState, 'Home'),
                const SizedBox(width: 12),
                _customChip(selectedOption, theme, setState, 'Work'),
              ],
            ),
          ],
        );
      },
    );
  }

  ChoiceChip _customChip(
    String selectedOption,
    ThemeData theme,
    StateSetter setState,
    String type,
  ) {
    return ChoiceChip(
      label: Text(type),
      selected: selectedOption == type,
      side: BorderSide.none,
      selectedColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.secondary,
      onSelected: (_) => setState(() => selectedOption = type),
    );
  }
}
