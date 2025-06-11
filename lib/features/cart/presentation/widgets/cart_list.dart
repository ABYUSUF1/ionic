import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';

import '../manager/cubit/cart_cubit.dart';
import 'cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return SkeletonLoading(
            isLoading: state.isLoading,
            child: ListView.separated(
              itemCount: state.maybeWhen(
                orElse: () => cubit.cartEntityList.length,
                loading: () => 1,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (BuildContext context, int index) {
                final CartEntity product = state.maybeWhen(
                  orElse: () => CartEntity.loading(),
                  success: (products) => products[index],
                );
                return CartListItem(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}
