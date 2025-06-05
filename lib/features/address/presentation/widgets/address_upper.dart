import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/theme/app_colors.dart';

class AddressUpper extends StatelessWidget {
  const AddressUpper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: Row(
        children: [
          const Icon(IconsaxPlusLinear.location, size: 18),
          const SizedBox(width: 4),
          Text(
            "Home",
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Default",
              style: theme.textTheme.labelSmall!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            label: const Text("Edit"),
            icon: const Icon(IconsaxPlusLinear.edit_2),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text("Delete"),
            icon: const Icon(IconsaxPlusLinear.trash),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
