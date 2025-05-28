import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

class CustomProfileBox extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CustomProfileBox({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsetsDirectional.only(
          bottom: 8,
          top: 8,
          end: ResponsiveLayout.isMobile(context) ? 16 : 0,
          start: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}
