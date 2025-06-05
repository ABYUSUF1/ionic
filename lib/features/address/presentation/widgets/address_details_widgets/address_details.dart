import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: Text(
              "dataggggggggggggggggggggggg ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggs",
              style: theme.textTheme.titleLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: AppColors.primaryColor,
            ),

            child: const Text(
              "Change",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
