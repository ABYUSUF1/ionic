// Filter Types
import 'package:flutter/material.dart';

class FilterOptions {
  final RangeValues priceRange;
  final int minRating;
  final Set<String> selectedBrands;

  FilterOptions({
    required this.priceRange,
    required this.minRating,
    required this.selectedBrands,
  });

  FilterOptions.initial()
    : priceRange = const RangeValues(0, 1000),
      minRating = 0,
      selectedBrands = {};

  FilterOptions copyWith({
    RangeValues? priceRange,
    int? minRating,
    Set<String>? selectedBrands,
  }) {
    return FilterOptions(
      priceRange: priceRange ?? this.priceRange,
      minRating: minRating ?? this.minRating,
      selectedBrands: selectedBrands ?? this.selectedBrands,
    );
  }
}

// Main Function to Show Filter Sheet
Future<FilterOptions?> showFiltersBottomSheet({
  required BuildContext context,
  required ThemeData theme,
  required FilterOptions initialFilters,
}) async {
  return await showModalBottomSheet<FilterOptions>(
    context: context,
    scrollControlDisabledMaxHeightRatio: .7,
    builder:
        (context) =>
            FiltersBottomSheet(theme: theme, initialFilters: initialFilters),
  );
}

// Main Bottom Sheet Widget
class FiltersBottomSheet extends StatefulWidget {
  final ThemeData theme;
  final FilterOptions initialFilters;

  const FiltersBottomSheet({
    required this.theme,
    required this.initialFilters,
    super.key,
  });

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  late FilterOptions _currentFilters;

  @override
  void initState() {
    super.initState();
    _currentFilters = widget.initialFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandle(),
          const SizedBox(height: 16),
          Text("Filter", style: widget.theme.textTheme.headlineMedium),
          const SizedBox(height: 24),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _PriceRangeFilter(
                    priceRange: _currentFilters.priceRange,
                    onChanged:
                        (range) => setState(() {
                          _currentFilters = _currentFilters.copyWith(
                            priceRange: range,
                          );
                        }),
                  ),
                  const SizedBox(height: 24),

                  _RatingFilter(
                    minRating: _currentFilters.minRating,
                    onChanged:
                        (rating) => setState(() {
                          _currentFilters = _currentFilters.copyWith(
                            minRating: rating,
                          );
                        }),
                  ),
                  const SizedBox(height: 24),

                  _BrandFilter(
                    selectedBrands: _currentFilters.selectedBrands,
                    onChanged:
                        (brands) => setState(() {
                          _currentFilters = _currentFilters.copyWith(
                            selectedBrands: brands,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          _FilterActions(
            onReset: () => Navigator.pop(context, FilterOptions.initial()),
            onApply: () => Navigator.pop(context, _currentFilters),
          ),
        ],
      ),
    );
  }
}

// Reusable Components
class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 4,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _PriceRangeFilter extends StatelessWidget {
  final RangeValues priceRange;
  final ValueChanged<RangeValues> onChanged;

  const _PriceRangeFilter({required this.priceRange, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _FilterSection(
      title: "Price Range",
      child: Column(
        children: [
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 1000,
            divisions: 10,
            labels: RangeLabels(
              "\$${priceRange.start.toInt()}",
              "\$${priceRange.end.toInt()}",
            ),
            onChanged: onChanged,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${priceRange.start.toInt()}"),
              Text("\$${priceRange.end.toInt()}"),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatingFilter extends StatelessWidget {
  final int minRating;
  final ValueChanged<int> onChanged;

  const _RatingFilter({required this.minRating, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _FilterSection(
      title: "Minimum Rating",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return IconButton(
            icon: Icon(
              Icons.star,
              size: 32,
              color: index < minRating ? Colors.amber : Colors.grey[300],
            ),
            onPressed: () => onChanged(index + 1),
          );
        }),
      ),
    );
  }
}

class _BrandFilter extends StatelessWidget {
  final Set<String> selectedBrands;
  final ValueChanged<Set<String>> onChanged;
  final List<String> availableBrands = const [
    "Nike",
    "Adidas",
    "Puma",
    "Reebok",
    "Under Armour",
  ];

  const _BrandFilter({required this.selectedBrands, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _FilterSection(
      title: "Brand",
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children:
            availableBrands.map((brand) {
              return FilterChip(
                label: Text(brand),
                selected: selectedBrands.contains(brand),
                onSelected: (selected) {
                  final newBrands = Set<String>.from(selectedBrands);
                  selected ? newBrands.add(brand) : newBrands.remove(brand);
                  onChanged(newBrands);
                },
              );
            }).toList(),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _FilterSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _FilterActions extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const _FilterActions({required this.onReset, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(onPressed: onReset, child: const Text("Reset")),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(onPressed: onApply, child: const Text("Apply")),
        ),
      ],
    );
  }
}
