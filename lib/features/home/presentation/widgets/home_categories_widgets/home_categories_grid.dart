import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/loading/skeleton_loading.dart';
import '../../../../../core/widgets/responsive_layout.dart';
import '../../manager/categories/categories_cubit.dart';
import 'home_categories_grid_item.dart';

class HomeCategoriesGrid extends StatelessWidget {
  const HomeCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final cubit = context.read<CategoriesCubit>();
        final isLoading = cubit.state.maybeWhen(
          orElse: () => false,
          loading: (_) => true,
        );

        final categories = cubit.state.when(
          initial: () => [],
          loading: (loadingCategories) => loadingCategories,
          success: (categories) => categories,
          error: () => [],
        );
        return Expanded(
          child: SkeletonLoading(
            isLoading: isLoading,
            child: GridView.builder(
              controller: cubit.scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveLayout.isMobile(context) ? 2 : 1,
                mainAxisExtent: ResponsiveLayout.isMobile(context) ? 79 : 100,
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
        );
      },
    );
  }
}
