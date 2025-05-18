import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/loading/normal_loading.dart';

import '../../theme/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  const CustomFilledButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor:
            isLoading ? theme.colorScheme.secondary : AppColors.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child:
          isLoading
              ? NormalLoading(color: Colors.white)
              : Text(
                text,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
    );
  }
}
