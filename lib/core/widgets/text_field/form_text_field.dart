import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class FormTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;

  const FormTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(title, style: theme.textTheme.bodyMedium!),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colorScheme.outline),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),

            error:
                errorText != null
                    ? Row(
                      children: [
                        Icon(
                          Icons.error,
                          color: theme.colorScheme.error,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          errorText!,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ],
                    )
                    : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
