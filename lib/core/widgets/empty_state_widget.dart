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
    final isMobile = ResponsiveLayout.isMobile(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svgImage != null) ...[
              ZoomIn(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 300),
                child: SvgPicture.asset(
                  svgImage!,
                  height: isMobile ? 180 : 220,
                ),
              ),
              const SizedBox(height: 30),
            ],
            Text(
              title,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: isMobile ? 22 : 28,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: isMobile ? 16 : 22,
              ),
              textAlign: TextAlign.center,
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
    );
  }
}
