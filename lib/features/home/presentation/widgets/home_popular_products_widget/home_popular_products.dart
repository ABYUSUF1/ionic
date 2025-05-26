import 'package:flutter/material.dart';

import 'home_popular_products_grid.dart';

class HomePopularProducts extends StatelessWidget {
  const HomePopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: 430,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 16.0, start: 16),
              child: Text(
                "Popular Products",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontFamily: "Pulp Display",
                ),
              ),
            ),
            const SizedBox(height: 16),
            const HomePopularProductsGrid(),
          ],
        ),
      ),
    );
  }
}
