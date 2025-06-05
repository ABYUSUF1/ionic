import 'package:flutter/material.dart';

class AddressUserInfo extends StatelessWidget {
  const AddressUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customInfo(theme, "Name", "John Doe"),
          customInfo(theme, "Address", "123 Street, City, Country"),
          customInfo(theme, "Phone", "123-456-7890"),
        ],
      ),
    );
  }

  Row customInfo(ThemeData theme, String title, String content) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text("$title:", style: theme.textTheme.bodySmall),
        ),
        Expanded(
          flex: 5,
          child: Text(content, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
