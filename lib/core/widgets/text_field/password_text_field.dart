import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class PasswordTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? prefixIcon;

  const PasswordTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.hintText,
    this.prefixIcon,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormField(
      validator: widget.validator,
      builder: (field) {
        return TextField(
          controller: widget.controller,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          style: theme.textTheme.bodyMedium,
          obscureText: obscureText,

          decoration: InputDecoration(
            prefixIcon:
                widget.prefixIcon == null ? null : Icon(widget.prefixIcon),

            /// ------------ suffix button (Handle Password Visibility)
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText
                    ? IconsaxPlusLinear.eye
                    : IconsaxPlusLinear.eye_slash,

                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            /// ------------ Texts
            labelText: widget.title,
            hintText: widget.hintText,

            /// ------------ Error Widget
            error:
                field.hasError
                    ? Row(
                      children: [
                        Icon(
                          IconsaxPlusLinear.warning_2,
                          color: theme.colorScheme.error,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          field.errorText!,
                          style: TextStyle(color: theme.colorScheme.error),
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
