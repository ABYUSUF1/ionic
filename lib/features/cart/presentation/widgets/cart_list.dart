import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../manager/cubit/cart_cubit.dart';
import 'cart_list_item.dart';

class CartList extends StatelessWidget {
  final List<CartEntity> products;
  const CartList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CartCubit>().state;
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Skeletonizer(
        enabled: state.isLoading,
        effect: ShimmerEffect(
          baseColor: color.secondary,
          highlightColor: color.surface,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.maybeWhen(
            orElse: () => products.length,
            loading: () => 2,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (BuildContext context, int index) {
            final CartEntity product = state.maybeWhen(
              orElse: () => CartEntity.loading(),
              success: (products, _) => products[index],
            );
            return CartListItem(product: product);
          },
        ),
      ),
    );
  }
}
