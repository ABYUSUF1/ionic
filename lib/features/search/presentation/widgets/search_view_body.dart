import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/loading/normal_loading.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:ionic/features/search/presentation/widgets/result_searches.dart';

import '../widgets/recent_searches.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();

        return Padding(
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
                () => const Center(
                  child: NormalLoading(color: AppColors.primaryColor),
                ),
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
