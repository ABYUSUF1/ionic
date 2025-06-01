import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/features/search/domain/repo/search_repo.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:ionic/features/search/presentation/widgets/result_searches.dart';

import '../../../../generated/locale_keys.g.dart';
import '../widgets/recent_searches.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => SearchCubit(getIt<SearchRepo>()),
      child: Scaffold(
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            final cubit = context.read<SearchCubit>();
            return Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  color: theme.colorScheme.surface,
                  height: 100,
                  child: TextField(
                    controller: cubit.searchController,
                    onTapOutside:
                        (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      hintText: context.tr(
                        LocaleKeys.common_search_for,
                        args: ['...'],
                      ),
                      hintStyle: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,

                      suffixIcon:
                          cubit.searchController.text.isNotEmpty
                              ? IconButton(
                                onPressed: () {
                                  cubit.clearSearch();
                                },
                                icon: const Icon(
                                  IconsaxPlusLinear.close_circle,
                                ),
                              )
                              : IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconsaxPlusLinear.search_normal_1,
                                ),
                              ),
                    ),
                    onChanged: (value) {
                      cubit.onSearchChange(value);
                    },
                  ),
                ),
                Expanded(
                  // Only one Expanded here
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: state.maybeWhen(
                      recentSearches:
                          (products) => RecentSearches(productsItem: products),
                      resultSearches:
                          (products, isPaginating) => ResultSearches(
                            productsEntity: products,
                            isPaginating: isPaginating,
                            onLoadMore:
                                () => cubit.onSearchChange(
                                  cubit.searchController.text,
                                  isLoadMore: true,
                                ),
                          ),

                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
