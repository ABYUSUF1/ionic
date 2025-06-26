import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: theme.colorScheme.secondary,
        highlightColor: theme.colorScheme.surface,
      ),
      child: AspectRatio(
        aspectRatio: 1, // Or match your image shape
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
