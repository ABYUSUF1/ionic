import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/functions/product_formatted.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';

class CheckoutItemsList extends StatelessWidget {
  const CheckoutItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final products = context.read<CartCubit>().cartEntity.cartProductsEntity;
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(height: 30),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: products[index].productItem.imageUrl,
                      height: 100,
                      width: 100,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.colorScheme.secondary,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "x ${products[index].quantity.toString()}",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].productItem.brand,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      products[index].productItem.title,
                      style: theme.textTheme.bodyLarge!,
                    ),
                    Text(
                      "EGP ${products[index].productItem.price.toString()}",
                      style: theme.textTheme.titleLarge!,
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          IconsaxPlusBold.back_square,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 20,
                        ),
                        Text(
                          formattedReturnPolicy(
                            context,
                            products[index].returnPolicy,
                          ),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
