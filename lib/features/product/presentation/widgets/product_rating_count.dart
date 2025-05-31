import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/utils/functions/star_color.dart';

class ProductRatingCount extends StatelessWidget {
  final Product product;
  const ProductRatingCount({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text("${product.rating ?? '-'} ", style: theme.textTheme.bodyMedium),
        Icon(Icons.star_rate_rounded, color: starColor(product.rating ?? 0)),
        Text(
          "(${product.formattedReviewsCount(context)})",
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
