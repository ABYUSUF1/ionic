import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return context.canPop()
        ? IconButton(
          onPressed: onPressed ?? () => context.pop(),
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
            minimumSize: const Size(50, 50),
          ),
          icon: const Icon(Icons.arrow_back),
        )
        : const SizedBox.shrink();
  }
}
