import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Navigator.canPop(context)
        ? IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
          ),
          icon: const Icon(Icons.arrow_back),
        )
        : const SizedBox.shrink();
  }
}
