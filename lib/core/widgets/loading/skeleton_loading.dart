import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const SkeletonLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: theme.colorScheme.surface,
        highlightColor: theme.colorScheme.secondary,
      ),
      child: child,
    );
  }
}
