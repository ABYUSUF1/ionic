import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/utils/functions/star_color.dart';

class ProductRatingCount extends StatelessWidget {
  final Product product;
  const ProductRatingCount({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${product.rating ?? '-'} ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Icon(Icons.star_rate_rounded, color: starColor(product.rating ?? 0)),
        Text(
          " (${product.reviews?.length ?? 0}) reviews",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
