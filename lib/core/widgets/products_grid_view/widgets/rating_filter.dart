import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/products_grid_view/manager/cubit/products_control_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class RatingFilter extends StatefulWidget {
  const RatingFilter({super.key});

  @override
  State<RatingFilter> createState() => _RatingFilterState();
}

class _RatingFilterState extends State<RatingFilter> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.filter_rating_title),
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Row(
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                Icons.star,
                size: 32,
                color:
                    index <
                            context
                                .read<ProductsControlCubit>()
                                .state
                                .currentRating
                        ? Colors.amber
                        : theme.colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {});
                context.read<ProductsControlCubit>().setRating(index + 1);
              },
            );
          }),
        ),
      ],
    );
  }
}
