import 'package:flutter/material.dart';

class CheckoutCustomBox extends StatelessWidget {
  final String title;
  final Widget child;
  const CheckoutCustomBox({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineMedium!.copyWith(fontSize: 20),
          ),
          child,
        ],
      ),
    );
  }
}
