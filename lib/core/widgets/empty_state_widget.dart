import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';

import 'responsive_layout.dart';

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
    final isMobile = ResponsiveLayout.isMobile(context);

    final double imageHeight = isMobile ? 180 : 200;
    final double titleFontSize = isMobile ? 22 : 26;
    final double subtitleFontSize = isMobile ? 16 : 20;

    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      from: 50,
      curve: Curves.ease,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          heightFactor: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (svgImage != null) ...[
                SvgPicture.asset(svgImage!, height: imageHeight),
                const SizedBox(height: 30),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: titleFontSize,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: subtitleFontSize,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (buttonText != null && onButtonPressed != null) ...[
                const SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: CustomFilledButton(
                    onPressed: onButtonPressed,
                    text: buttonText!,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
