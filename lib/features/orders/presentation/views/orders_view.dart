import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/order_list_item.dart';
import '../widgets/orders_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<OrdersCubit>();
    cubit.fetchOrders();

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final orders = state.maybeWhen(
          orElse: () => [OrdersEntity.loading()],
          success: (orderEntity) => orderEntity,
        );
        return state.maybeWhen(
          orElse:
              () => Scaffold(
                appBar: const OrdersAppBar(),
                body: SkeletonLoading(
                  isLoading: state.isLoading,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderListItem(
                        orderId: orders[index].orderId,
                        itemCount: orders[index].products.length,
                        date: orders[index].arrivedAt.toString(),
                        total: orders[index].totalPrice.toString(),
                        status: orders[index].orderStatus.name,
                        statusColor: theme.colorScheme.primary,
                      );
                    },
                  ),
                ),
              ),
          error:
              (errMessage) => EmptyStateWidget.withButton(
                title: context.tr(LocaleKeys.common_something_went_wrong),
                subtitle: errMessage,
                buttonText: "Try Again",
                onButtonPressed: () => cubit.fetchOrders(),
              ),
        );
      },
    );
  }
}
