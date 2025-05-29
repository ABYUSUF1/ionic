import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../manager/cubit/categories_cubit.dart';
import 'filter_tab_content.dart';
import 'sort_tab_content.dart';

class CategoriesAppBarSettingsButton extends StatelessWidget {
  const CategoriesAppBarSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          scrollControlDisabledMaxHeightRatio: .7,
          backgroundColor: theme.colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) {
            return BlocProvider.value(
              value: context.read<CategoriesCubit>(),
              child: DefaultTabController(
                length: 2, // Needed for TabBar and TabBarView to work
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    TabBar(
                      indicatorColor: theme.colorScheme.primary,
                      labelColor: theme.colorScheme.primary,
                      unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                      tabs: const [
                        Tab(
                          text: "Filter",
                          icon: Icon(IconsaxPlusLinear.filter),
                        ),
                        Tab(text: "Sort", icon: Icon(IconsaxPlusLinear.sort)),
                      ],
                    ),
                    const Divider(height: 1),
                    const Expanded(
                      child: TabBarView(
                        children: [FilterTabContent(), SortTabContent()],
                      ),
                    ),
                  ],
                ),
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
