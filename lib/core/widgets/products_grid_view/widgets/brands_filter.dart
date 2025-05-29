import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_cubit.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_state.dart';

class BrandsFilter extends StatelessWidget {
  const BrandsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsControlCubit, ProductsControlState>(
      builder: (context, state) {
        final cubit = context.read<ProductsControlCubit>();
        final allBrands = cubit.state.allBrands.toList();
        final selectedBrands = cubit.state.selectedBrands;

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
    ProductsControlCubit cubit,
  ) {
    final theme = Theme.of(context);
    return FilterChip(
      label: Text(
        brand,
        style: theme.textTheme.bodySmall!.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      deleteIconColor: theme.colorScheme.onSurface,
      selected: isSelected,
      onSelected: (_) => cubit.toggleBrand(brand),
      side: BorderSide(color: theme.colorScheme.outline),
    );
  }
}
