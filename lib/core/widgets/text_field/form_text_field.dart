import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/constants/app_assets.dart';

import '../../theme/app_colors.dart';

class FormTextField extends StatefulWidget {
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
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  bool get isPassword => widget.title.toLowerCase().contains("password");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(widget.title, style: theme.textTheme.bodyMedium),
        ),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: isPassword ? _obscureText : false,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 14,
            ),
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
              borderSide: const BorderSide(color: AppColors.primaryColor),
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
                      icon: SvgPicture.asset(
                        _obscureText
                            ? AppAssets
                                .iconsEyeSlash // closed eye
                            : AppAssets
                                .iconsEye, // open eye (you should provide this)
                      ),
                    )
                    : null,
            error:
                widget.errorText != null
                    ? Row(
                      children: [
                        Icon(
                          Icons.error,
                          color: theme.colorScheme.error,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.errorText!,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ],
                    )
                    : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
