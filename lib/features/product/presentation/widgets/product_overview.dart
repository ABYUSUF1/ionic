import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

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
          child: ResponsiveLayout(
            tabletChild: ProductOverviewTablet(product: product),
            mobileChild: ProductOverviewMobile(product: product),
          ),
        ),
      ],
    );
  }
}

class ProductOverviewMobile extends StatelessWidget {
  const ProductOverviewMobile({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductOverallRating(product: product!),
        const Divider(),
        ProductReviews(reviews: product!.reviews!),
      ],
    );
  }
}

class ProductOverviewTablet extends StatelessWidget {
  const ProductOverviewTablet({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: ProductOverallRating(product: product!)),
        Expanded(flex: 2, child: ProductReviews(reviews: product!.reviews!)),
      ],
    );
  }
}
