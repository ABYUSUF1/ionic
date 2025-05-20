import 'package:flutter/material.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Delete Account",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
