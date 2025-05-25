import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/home/presentation/manager/cubit/categories_cubit.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/scroll_indicator.dart';
import '../../domain/repo/home_repo.dart';
import 'home_categories_grid_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(getIt<HomeRepo>()),
      child: SliverToBoxAdapter(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            final cubit = context.read<CategoriesCubit>();
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: (_) => true,
            );

            final categories = state.when(
              initial: () => [],
              loading: (loadingCategories) => loadingCategories,
              success: (categories) => categories,
              error: () => [],
            );

            return Container(
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16.0,
                      top: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontFamily: "Pulp Display"),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          label: Text("View All"),
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          iconAlignment: IconAlignment.end,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SkeletonLoading(
                      isLoading: isLoading,
                      child: GridView.builder(
                        controller: cubit.scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 79,
                            ),
                        itemCount: isLoading ? 10 : categories.length,
                        itemBuilder: (context, index) {
                          final category =
                              isLoading
                                  ? categories.isNotEmpty
                                      ? categories.first
                                      : null
                                  : categories[index];

                          if (category == null) return const SizedBox.shrink();
                          return HomeCategoriesGridItem(category: category);
                        },
                      ),
                    ),
                  ),

                  ScrollIndicator(
                    scrollController: cubit.scrollController,
                    width: 50,
                    height: 5,
                    indicatorWidth: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    indicatorDecoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
