import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';

import '../../../../generated/locale_keys.g.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SearchCubit>();

    return TextField(
      controller: cubit.searchController,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: context.tr(LocaleKeys.common_search_for, args: ['...']),
        hintStyle: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        prefixIcon: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
        ),
        suffixIcon: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return cubit.searchController.text.isNotEmpty
                ? IconButton(
                  onPressed: cubit.clearSearch,
                  icon: const Icon(IconsaxPlusLinear.close_circle),
                )
                : IconButton(
                  onPressed: () {},
                  icon: const Icon(IconsaxPlusLinear.search_normal_1),
                );
          },
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme.colorScheme.secondary,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onChanged: cubit.onSearchChange,
    );
  }
}
