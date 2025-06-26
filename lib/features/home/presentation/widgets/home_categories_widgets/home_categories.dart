import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/theme/app_font.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/home/presentation/manager/categories/home_categories_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../domain/repo/home_repo.dart';
import 'home_categories_grid.dart';
import 'home_categories_scroll_indicator.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => HomeCategoriesCubit(getIt<HomeRepo>()),
      child: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: ResponsiveLayout.isMobile(context) ? 300 : 230,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 16.0,
                  start: 16,
                  bottom: 8,
                ),
                child: Text(
                  context.tr(LocaleKeys.home_categories),
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontFamily: appFont(context),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const HomeCategoriesGrid(),
              const HomeCategoriesScrollIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
