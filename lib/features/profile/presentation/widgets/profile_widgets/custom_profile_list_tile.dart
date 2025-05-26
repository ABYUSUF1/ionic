import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const CustomProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title, style: theme.textTheme.bodyMedium),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}
