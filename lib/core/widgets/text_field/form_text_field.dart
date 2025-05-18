import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../theme/app_colors.dart';

class FormTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;
  final IconData? prefixIcon;

  const FormTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.validator,
    this.errorText,
    this.prefixIcon,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  bool get isPassword => widget.title.toLowerCase().contains("password");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      obscureText: isPassword ? _obscureText : false,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: theme.textTheme.bodySmall,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        label: Text(
          widget.title,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
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
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? IconsaxPlusLinear.eye_slash
                        : IconsaxPlusLinear.eye,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
                : null,
        error:
            widget.errorText != null
                ? Row(
                  children: [
                    Icon(
                      IconsaxPlusLinear.warning_2,
                      color: theme.colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.errorText!,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                )
                : null,
      ),
      validator: widget.validator,
    );
  }
}
