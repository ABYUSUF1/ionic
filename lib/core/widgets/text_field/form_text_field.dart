import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class FormTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final int? maxLines;

  const FormTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.suffix,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormField(
      validator: validator,
      builder: (field) {
        return TextField(
          controller: controller,
          maxLines: maxLines ?? 1,
          onChanged: (value) {
            field.didChange(value);
            onChanged?.call(value);
          },
          onTap: onTap,
          readOnly: readOnly ?? false,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          keyboardType: keyboardType,
          style: theme.textTheme.bodyMedium,
          inputFormatters: [
            if (keyboardType == TextInputType.number ||
                keyboardType == TextInputType.phone)
              FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),

            /// ------------ suffix button
            suffixIcon: suffix,

            /// ------------ Texts
            labelText: title,
            hintText: hintText,

            /// ------------ Error Widget
            error:
                field.hasError
                    ? Row(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start, // optional: aligns icon to top
                      children: [
                        Icon(
                          IconsaxPlusLinear.warning_2,
                          color: theme.colorScheme.error,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            field.errorText!,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
                      ],
                    )
                    : null,
          ),
        );
      },
    );
  }
}
