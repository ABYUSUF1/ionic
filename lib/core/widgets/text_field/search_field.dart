import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String? hintText;
  const SearchField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.search),
        hintText: hintText ?? "Search",
      ),
    );
  }
}
