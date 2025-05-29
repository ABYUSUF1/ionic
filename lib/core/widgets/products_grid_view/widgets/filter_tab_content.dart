import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/price_range_filter.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/rating_filter.dart';

import 'brands_filter.dart';

class FilterTabContent extends StatelessWidget {
  const FilterTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [PriceRangeFilter(), RatingFilter(), BrandsFilter()],
      ),
    );
  }
}
