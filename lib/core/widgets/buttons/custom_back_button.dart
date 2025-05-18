import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return context.canPop()
        ? IconButton(
          onPressed: () {
            context.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
            minimumSize: const Size(50, 50),
          ),
          icon: const Icon(Icons.arrow_back),
        )
        : const SizedBox.shrink();
  }
}
