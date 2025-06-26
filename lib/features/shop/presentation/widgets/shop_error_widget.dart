import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';

import '../../../../generated/locale_keys.g.dart';
import '../manager/cubit/shop_cubit.dart';

class ShopErrorWidget extends StatelessWidget {
  final String errorMessage;
  const ShopErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: EmptyStateWidget.withButton(
        title: context.tr(LocaleKeys.common_something_went_wrong),
        subtitle: errorMessage,
        buttonText: context.tr(LocaleKeys.common_try_again),
        onButtonPressed: () async {
          await context.read<ShopCubit>().fetchProducts();
        },
      ),
    );
  }
}
