import 'package:flutter/material.dart';

import 'buttons/custom_back_button.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomSheet;
  const CustomScaffold({
    super.key,
    required this.body,
    this.bottomSheet,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomSheet: bottomSheet,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CustomBackButton(),
            const SizedBox(width: 16),
            Text(title, style: theme.textTheme.headlineMedium),
          ],
        ),
      ),
      body: body,
    );
  }
}
