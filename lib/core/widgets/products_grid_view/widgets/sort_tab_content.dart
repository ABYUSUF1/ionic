import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_state.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../manager/cubit/products_control_cubit.dart';

class SortTabContent extends StatelessWidget {
  const SortTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ProductsControlCubit>();

    return BlocBuilder<ProductsControlCubit, ProductsControlState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              context.tr(LocaleKeys.sort_by),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            RadioListTile<SortOption>(
              title: Text(context.tr(LocaleKeys.sort_by_recommended)),
              value: SortOption.recommended,
              groupValue: cubit.state.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: Text(context.tr(LocaleKeys.sort_by_price_low_to_high)),
              value: SortOption.lowToHigh,
              groupValue: cubit.state.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: Text(context.tr(LocaleKeys.sort_by_price_high_to_low)),
              value: SortOption.highToLow,
              groupValue: cubit.state.currentSort,
              onChanged: (value) {
                if (value != null) cubit.setSortOption(value);
              },
            ),
            RadioListTile<SortOption>(
              title: Text(context.tr(LocaleKeys.sort_by_top_rated)),
              value: SortOption.topRated,
              groupValue: cubit.state.currentSort,
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
