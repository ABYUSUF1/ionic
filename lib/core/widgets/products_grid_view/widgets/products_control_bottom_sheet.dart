import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../generated/locale_keys.g.dart';
import '../manager/cubit/products_control_cubit.dart';
import 'filter_tab_content.dart';
import 'sort_tab_content.dart';

Future<void> productsControlBottomSheet(BuildContext context) async {
  final theme = Theme.of(context);
  await showModalBottomSheet<void>(
    context: context,
    scrollControlDisabledMaxHeightRatio: .7,
    backgroundColor: theme.colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return BlocProvider.value(
        value: context.read<ProductsControlCubit>(),
        child: DefaultTabController(
          length: 2, // Needed for TabBar and TabBarView to work
          child: Column(
            children: [
              const SizedBox(height: 8),

              TabBar(
                indicatorColor: theme.colorScheme.primary,
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                tabs: [
                  Tab(
                    text: context.tr(LocaleKeys.filter_title),
                    icon: const Icon(IconsaxPlusLinear.filter),
                  ),
                  Tab(
                    text: context.tr(LocaleKeys.sort_title),
                    icon: const Icon(IconsaxPlusLinear.sort),
                  ),
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
}
