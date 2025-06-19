import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? svgImage;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget._({
    this.svgImage,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onButtonPressed,
    super.key,
  });

  /// Basic constructor without button
  factory EmptyStateWidget({
    String? svgImage,
    required String title,
    required String subtitle,
    Key? key,
  }) {
    return EmptyStateWidget._(
      svgImage: svgImage,
      title: title,
      subtitle: subtitle,
      key: key,
    );
  }

  /// Constructor with action button
  factory EmptyStateWidget.withButton({
    String? svgImage,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonPressed,
    Key? key,
  }) {
    return EmptyStateWidget._(
      svgImage: svgImage,
      title: title,
      subtitle: subtitle,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svgImage != null) ...[
              SvgPicture.asset(svgImage!, height: 180),
              const SizedBox(height: 30),
            ],
            Text(
              title,
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 30),
              CustomFilledButton(onPressed: onButtonPressed, text: buttonText!),
            ],
          ],
        ),
      ),
    );
  }
}
