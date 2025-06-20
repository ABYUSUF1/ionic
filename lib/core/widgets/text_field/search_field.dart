import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final Widget helperText;
  final void Function(String)? onChanged;
  const SearchField({
    super.key,
    required this.hintText,
    required this.helperText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: onChanged,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 80),
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        fillColor: theme.colorScheme.secondary,
        filled: true,
        helper: helperText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
