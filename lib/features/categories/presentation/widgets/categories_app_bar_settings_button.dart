import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CategoriesAppBarSettingsButton extends StatelessWidget {
  const CategoriesAppBarSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () async {
        showModalBottomSheet(
          context: context,
          scrollControlDisabledMaxHeightRatio: .7,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.surface,
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Filter",
                    icon: Icon(
                      IconsaxPlusLinear.filter,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Tab(
                    text: "Sort",
                    icon: Icon(
                      IconsaxPlusLinear.sort,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        minimumSize: const Size(55, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(
        IconsaxPlusLinear.setting_4,

        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _FilterTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Filter Options", style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        // Example filters
        CheckboxListTile(
          title: const Text("Only Available"),
          value: true,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text("Discounted"),
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class _SortTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Sort By", style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        RadioListTile(
          title: const Text("Price: Low to High"),
          value: "lowToHigh",
          groupValue: "lowToHigh",
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text("Price: High to Low"),
          value: "highToLow",
          groupValue: "lowToHigh",
          onChanged: (value) {},
        ),
      ],
    );
  }
}
