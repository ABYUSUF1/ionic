import 'package:flutter/material.dart';

class CustomEditProfileBox extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomEditProfileBox({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontFamily: 'Pulp Display',
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.colorScheme.surface,
          ),
          child: child,
        ),
      ],
    );
  }
}
