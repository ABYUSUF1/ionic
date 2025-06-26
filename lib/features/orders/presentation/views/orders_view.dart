import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/order_list_item.dart';
import '../widgets/orders_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final cubit = context.read<OrdersCubit>();
    cubit.fetchOrders();

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final orders = state.maybeWhen(
          success: (allOrders, filtered) => filtered ?? allOrders,
          orElse: () => List.generate(3, (_) => OrdersEntity.loading()),
        );

        return Scaffold(
          backgroundColor:
              state.isSuccess
                  ? theme.scaffoldBackgroundColor
                  : theme.colorScheme.surface,
          appBar: const OrdersAppBar(),
          body: state.maybeWhen(
            error:
                (errMessage) => EmptyStateWidget.withButton(
                  title: context.tr(LocaleKeys.common_something_went_wrong),
                  subtitle: errMessage,
                  buttonText: context.tr(LocaleKeys.common_try_again),
                  onButtonPressed: () => cubit.fetchOrders(),
                ),
            empty:
                (message) => EmptyStateWidget(
                  title: context.tr(LocaleKeys.orders_empty),
                  subtitle: message,
                  svgImage:
                      isDarkMode
                          ? AppAssets.illustrationsEmptyIllustrationDark
                          : AppAssets.illustrationsEmptyIllustrationLight,
                ),
            orElse:
                () => Skeletonizer(
                  enabled: state.isLoading,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      final order = orders[index];
                      return OrderListItem(orderEntity: order);
                    },
                  ),
                ),
          ),
        );
      },
    );
  }
}
