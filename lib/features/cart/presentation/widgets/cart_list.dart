import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

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
          return ListView.separated(
            itemCount: cubit.cartProducts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (BuildContext context, int index) {
              final product = state.maybeWhen(
                orElse: () => ProductItemEntity.loading(),
                success: (products) => products[index],
              );
              return CartListItem(product: product);
            },
          );
        },
      ),
    );
  }
}
