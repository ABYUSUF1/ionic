import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/utils/functions/star_color.dart';
import 'package:ionic/core/widgets/rating_bar_indicator.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

import '../../../../core/theme/app_font.dart';
import '../../../../generated/locale_keys.g.dart';

class ProductOverallRating extends StatelessWidget {
  final Product product;

  const ProductOverallRating({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isMobile(context)
        ? _buildMobileLayout(context)
        : _buildTabletLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left rating summary
        _buildRatingSummary(theme, context),
        const SizedBox(width: 16),
        // Right rating breakdown
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              int rating = 5 - index; // 5 to 1
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: _buildRatingRow(rating, context),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating summary at top
        _buildRatingSummary(theme, context),
        const SizedBox(height: 16),
        // Rating breakdown below
        Column(
          children: List.generate(5, (index) {
            int rating = 5 - index; // 5 to 1
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: _buildRatingRow(rating, context),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRatingSummary(ThemeData theme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.product_overall_rating),
          style: theme.textTheme.bodyMedium!.copyWith(
            fontFamily: appFont(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(product.rating!.toString(), style: theme.textTheme.headlineMedium),
        const SizedBox(height: 4),
        RatingBarIndicator(rating: product.rating!),
        const SizedBox(height: 4),
        Text(
          context.tr(
            LocaleKeys.product_based_on_reviews,
            args: [(product.reviews?.length ?? 0).toString()],
          ),
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  List<int> _calculateRatingCounts() {
    final ratingCounts = List<int>.filled(5, 0);
    for (var review in product.reviews ?? []) {
      if (review.rating != null && review.rating! >= 1 && review.rating! <= 5) {
        ratingCounts[review.rating! - 1]++;
      }
    }
    return ratingCounts;
  }

  double _calculatePercentage(int rating) {
    final reviews = product.reviews ?? [];
    if (reviews.isEmpty) return 0;
    final ratingCounts = _calculateRatingCounts();
    return ratingCounts[rating - 1] / reviews.length;
  }

  Widget _buildRatingRow(int rating, BuildContext context) {
    final percentage = _calculatePercentage(rating);
    final color = starColor(rating.toDouble());

    return Row(
      children: [
        SizedBox(width: 16, child: Text("$rating")),
        Icon(Icons.star, color: color, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Theme.of(context).colorScheme.outline,
            color: color,
            minHeight: 4,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 40,
          child: Text("${(percentage * 100).toStringAsFixed(0)}%"),
        ),
      ],
    );
  }
}
