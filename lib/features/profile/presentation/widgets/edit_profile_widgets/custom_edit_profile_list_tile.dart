import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomEditProfileListTile extends StatelessWidget {
  final String title;
  final String content;
  final bool canEdit;
  final Function()? onTap;
  const CustomEditProfileListTile({
    super.key,
    required this.title,
    required this.content,
    this.canEdit = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              content,
              style: theme.textTheme.bodyMedium!.copyWith(
                color:
                    canEdit
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),

          Icon(
            IconsaxPlusLinear.arrow_right_1,
            color:
                canEdit
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
