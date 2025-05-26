import 'package:flutter/material.dart';

class DropDownQuantityButton extends StatefulWidget {
  const DropDownQuantityButton({super.key});

  @override
  State<DropDownQuantityButton> createState() => _DropDownQuantityButtonState();
}

class _DropDownQuantityButtonState extends State<DropDownQuantityButton> {
  int _selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
            child: Text('Qty: ${index + 1}'),
          ),
        ),
        underline: Container(), // optional: remove underline
        style: Theme.of(context).textTheme.bodyMedium,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
