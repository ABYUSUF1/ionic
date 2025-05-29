import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  final String svgImage;
  final String title;
  final String subtitle;
  const EmptyWidget({
    super.key,
    required this.svgImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(svgImage),

          Text(title, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
