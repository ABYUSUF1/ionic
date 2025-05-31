import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class DropDownQuantityButton extends StatefulWidget {
  const DropDownQuantityButton({super.key});

  @override
  State<DropDownQuantityButton> createState() => _DropDownQuantityButtonState();
}

class _DropDownQuantityButtonState extends State<DropDownQuantityButton> {
  int _selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 55,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),

      child: DropdownButton<int>(
        value: _selectedQuantity,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedQuantity = value;
            });
          }
        },
        items: List.generate(
          10,
          (index) => DropdownMenuItem<int>(
            value: index + 1,
            child: Text(
              context.tr(LocaleKeys.cart_qty, args: [(index + 1).toString()]),
            ),
          ),
        ),
        underline: Container(), // optional: remove underline
        style: theme.textTheme.bodyMedium,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
