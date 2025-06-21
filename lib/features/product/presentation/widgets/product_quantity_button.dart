import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/product_cubit.dart';

class ProductQuantityButton extends StatelessWidget {
  const ProductQuantityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final selectedQuantity = state.maybeWhen(
          success: (_, quantity) => quantity,
          orElse: () => 1,
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: 55,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<int>(
            value: selectedQuantity,
            onChanged: (value) {
              if (value != null) {
                context.read<ProductCubit>().updateQuantity(value);
              }
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem<int>(
                value: index + 1,
                child: Text(
                  context.tr(
                    LocaleKeys.cart_qty,
                    args: [(index + 1).toString()],
                  ),
                ),
              ),
            ),
            underline: Container(),
            style: theme.textTheme.bodyMedium,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}
