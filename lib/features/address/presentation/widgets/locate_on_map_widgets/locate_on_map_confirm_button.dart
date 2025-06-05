import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../manager/add_or_edit_address/locate_on_map_cubit.dart';

class LocateOnMapConfirmButton extends StatelessWidget {
  const LocateOnMapConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<LocateOnMapCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomFilledButton(
        text: "Confirm Location",
        textStyle: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color:
              state.isSuccess
                  ? Colors.white
                  : theme.colorScheme.onSurfaceVariant,
        ),
        buttonColor:
            state.isSuccess
                ? AppColors.primaryColor
                : theme.colorScheme.secondary,
        onPressed:
            state.isSuccess
                ? () => context.push(AppRouterName.addressDetailsRoute)
                : null,
      ),
    );
  }
}
