import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/products_entity.dart';

import '../manager/cubit/products_control_cubit.dart';

class SortTabContent extends StatelessWidget {
  const SortTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ProductsControlCubit>();

    return BlocBuilder<ProductsControlCubit, ProductsEntity>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text("Sort By", style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            RadioListTile<SortOption>(
              title: const Text("Recommended"),
              value: SortOption.recommended,
              groupValue: cubit.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: const Text("Price: Low to High"),
              value: SortOption.lowToHigh,
              groupValue: cubit.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: const Text("Price: High to Low"),
              value: SortOption.highToLow,
              groupValue: cubit.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: const Text("Top Rated"),
              value: SortOption.topRated,
              groupValue: cubit.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
          ],
        );
      },
    );
  }
}
