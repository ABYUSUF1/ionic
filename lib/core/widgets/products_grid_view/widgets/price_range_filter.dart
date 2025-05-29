import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_cubit.dart';

class PriceRangeFilter extends StatefulWidget {
  const PriceRangeFilter({super.key});

  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    final state = context.read<ProductsControlCubit>().state;
    _currentRange = RangeValues(state.minPrice, state.maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        RangeSlider(
          values: _currentRange,
          min: 0,
          max: 2000,
          divisions: 10,
          labels: RangeLabels(
            _currentRange.start.toStringAsFixed(0),
            _currentRange.end.toStringAsFixed(0),
          ),
          onChanged: (value) {
            setState(() {
              _currentRange = value;
            });

            // Update filter in Cubit
            context.read<ProductsControlCubit>().setPriceRange(
              value.start,
              value.end,
            );
          },
        ),
      ],
    );
  }
}
