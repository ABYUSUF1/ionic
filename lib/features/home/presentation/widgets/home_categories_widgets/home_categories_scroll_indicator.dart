import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/scroll_indicator.dart';
import '../../manager/categories/home_categories_cubit.dart';

class HomeCategoriesScrollIndicator extends StatelessWidget {
  const HomeCategoriesScrollIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCategoriesCubit>();
    return ScrollIndicator(
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
    );
  }
}
