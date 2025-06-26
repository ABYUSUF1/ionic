import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../manager/cubit/orders_cubit.dart';
import 'orders_search_field.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.read<OrdersCubit>().state;

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomBackButton(),
                  ),
                  Image.asset(AppAssets.logoIonicLogo, height: 35),
                ],
              ),
              if (state.isSuccess) ...[
                const SizedBox(height: 12),
                const OrdersSearchFiled(),
              ] else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(141);
}
