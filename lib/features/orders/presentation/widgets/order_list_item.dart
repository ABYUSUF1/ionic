import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import 'order_status_widget.dart';

class OrderListItem extends StatelessWidget {
  final OrdersEntity orderEntity;
  const OrderListItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 255,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderEntity.orderId,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.plural(
                  LocaleKeys.common_items_count,
                  orderEntity.products.length,
                  args: [orderEntity.products.length.toString()],
                ),
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              OrderStatusWidget(
                statusColor: AppColors.primaryColor,
                status: orderEntity.orderStatus.name,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Column(
                children:
                    orderEntity.products
                        .take(2)
                        .map(
                          (e) => ListTile(
                            isThreeLine: true,
                            dense: true,
                            title: Text(
                              e.brand.isEmpty
                                  ? context.tr(LocaleKeys.product_brand_unknown)
                                  : e.brand,
                              style: theme.textTheme.bodySmall,
                            ),
                            subtitle: Text(
                              e.name,
                              style: theme.textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: theme.colorScheme.secondary,
                              ),
                              child:
                                  context.read<OrdersCubit>().state.isLoading
                                      ? null
                                      : CachedNetworkImage(
                                        imageUrl: e.imageUrl,
                                        width: 50,
                                        height: 50,
                                      ),
                            ),
                          ),
                        )
                        .toList(),
              ),

              // Shadow gradient from bottom of ListTile section to middle of 2nd item
              orderEntity.products.length == 1
                  ? const SizedBox.shrink()
                  : Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 50, // Adjust to cover about half of 2nd ListTile
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              theme.colorScheme.surface,
                              theme.colorScheme.surface.withValues(alpha: 0.85),
                              theme.colorScheme.surface.withValues(alpha: 0.6),
                              theme.colorScheme.surface.withValues(alpha: 0.0),
                            ],
                            stops: const [0.0, 0.4, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          const Spacer(),
          Center(
            child: TextButton.icon(
              onPressed: () {
                context.pushNamed(
                  AppRouterName.orderDetailsRoute,
                  extra: orderEntity,
                );
              },
              iconAlignment: IconAlignment.end,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.primaryColor,
              ),
              label: Text(
                context.tr(LocaleKeys.orders_show_details),
                style: theme.textTheme.labelSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
