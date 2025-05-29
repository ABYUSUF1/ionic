import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/categories/presentation/manager/cubit/categories_cubit.dart';

class BrandsFilter extends StatelessWidget {
  const BrandsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final cubit = context.read<CategoriesCubit>();
        final allBrands = cubit.allBrands.toList();
        final selectedBrands = cubit.selectedBrands;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Brands", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  allBrands
                      .map(
                        (brand) => _buildFilterChip(
                          context,
                          brand,
                          selectedBrands.contains(brand),
                          cubit,
                        ),
                      )
                      .toList(),
            ),
          ],
        );
      },
    );
  }

  FilterChip _buildFilterChip(
    BuildContext context,
    String brand,
    bool isSelected,
    CategoriesCubit cubit,
  ) {
    return FilterChip(
      label: Text(brand),
      selected: isSelected,
      onSelected: (_) => cubit.toggleBrand(brand),
      side: BorderSide(color: Theme.of(context).colorScheme.outline),
    );
  }
}
