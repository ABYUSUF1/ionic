import 'package:flutter/material.dart';
import 'package:ionic/core/utils/functions/star_color.dart';

class RatingBarIndicator extends StatelessWidget {
  final double rating;
  final double? size;
  const RatingBarIndicator({super.key, required this.rating, this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_rate_rounded,
          color:
              index < rating
                  ? starColor(rating)
                  : theme.colorScheme.onSurfaceVariant,
          size: size ?? 16,
        ),
      ),
    );
  }
}
