import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String? hintText;
  const SearchField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 80),
        prefixIcon: const Icon(Icons.search),
        hintText: hintText ?? "Search",
        fillColor: theme.colorScheme.secondary,
        filled: true,
        helperText: "You have 2 favorites",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
