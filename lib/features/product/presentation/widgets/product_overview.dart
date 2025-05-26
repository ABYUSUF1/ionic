import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';

import 'product_overall_rating.dart';
import 'product_reviews.dart';

class ProductOverview extends StatelessWidget {
  final Product? product;
  const ProductOverview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Overview", style: theme.textTheme.headlineMedium),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductOverallRating(product: product!),
              const Divider(),
              ProductReviews(reviews: product!.reviews!),
            ],
          ),
        ),
      ],
    );
  }
}
