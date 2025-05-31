import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/review.dart';

import '../../../../core/constants/app_font.dart';
import '../../../../core/widgets/rating_bar_indicator.dart';
import '../../../../generated/locale_keys.g.dart';

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
          context.tr(LocaleKeys.product_reviews),
          style: theme.textTheme.bodyMedium!.copyWith(
            fontFamily: appFont(context),
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
                  fontFamily: appFont(context),
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
