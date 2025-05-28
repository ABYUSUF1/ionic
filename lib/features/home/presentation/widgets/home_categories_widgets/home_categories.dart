import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/home/presentation/manager/categories/categories_cubit.dart';

import '../../../domain/repo/home_repo.dart';
import 'home_categories_grid.dart';
import 'home_categories_scroll_indicator.dart';
import 'home_categories_upper.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(getIt<HomeRepo>()),
      child: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: ResponsiveLayout.isMobile(context) ? 300 : 230,
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCategoriesUpper(),
              SizedBox(height: 8),
              HomeCategoriesGrid(),
              HomeCategoriesScrollIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
