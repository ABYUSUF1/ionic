import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/review.dart';

import '../../../../core/widgets/rating_bar_indicator.dart';

class ProductReviews extends StatelessWidget {
  final List<Review> reviews;
  const ProductReviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontFamily: "Pulp Display",
          ),
        ),
        const SizedBox(height: 8),
        ...reviews.take(3).toList().asMap().entries.expand((entry) {
          final index = entry.key;
          final review = entry.value;

          return [
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(child: Text(review.reviewerInitialsName)),
              title: Text(
                review.reviewerName ?? 'Unknown Reviewer',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontFamily: "Pulp Display",
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.formattedDate,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  RatingBarIndicator(rating: review.rating!.toDouble()),
                  const SizedBox(height: 8),
                  Text(
                    review.comment ?? 'No comment provided',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            // Don't show divider after last
            if (index < reviews.take(3).length - 1)
              const Divider(endIndent: 16, indent: 16),
          ];
        }),
      ],
    );
  }
}
