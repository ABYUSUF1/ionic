import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/generated/locale_keys.g.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(const OrdersState.initial());

  List<OrdersEntity> orders = [];

  bool get isOrdersFetched => orders.isNotEmpty;

  // 🔄 Fetch all orders
  Future<void> fetchOrders(BuildContext context) async {
    if (orders.isNotEmpty && isOrdersFetched) {
      emit(OrdersState.success(orders));
      return;
    }

    emit(const OrdersState.loading());
    final result = await ordersRepo.fetchOrders();
    result.fold((failure) => emit(OrdersState.error(failure.errMessage)), (
      fetchedOrders,
    ) {
      orders = fetchedOrders;

      if (orders.isEmpty) {
        emit(OrdersState.empty(context.tr(LocaleKeys.orders_empty_desc)));
      } else {
        emit(OrdersState.success(orders));
      }
    });
  }

  // ➕ Add a new order
  Future<void> addToOrders(OrdersEntity newOrder) async {
    emit(const OrdersState.loading());

    final result = await ordersRepo.addOrder(newOrder);

    result.fold((failure) => emit(OrdersState.error(failure.errMessage)), (
      orderId,
    ) {
      final newOrderWithId = newOrder.copyWith(orderId: orderId);
      orders.add(newOrderWithId);

      emit(OrdersState.success(orders));
    });
  }

  // 🔍 Search orders by product name or created date
  void onSearchChanged(String query, BuildContext context) {
    if (query.trim().isEmpty) {
      emit(OrdersState.success(orders));
      return;
    }

    final lowerQuery = query.toLowerCase();

    final filtered =
        orders.where((order) {
          final matchesProductName = order.products.any(
            (product) => product.name.toLowerCase().contains(lowerQuery),
          );

          final formattedDate = DateFormat('yyyy-MM-dd').format(order.placedAt);
          final matchesDate = formattedDate.contains(lowerQuery);

          return matchesProductName || matchesDate;
        }).toList();

    if (filtered.isEmpty) {
      emit(
        OrdersState.empty(
          context.tr(LocaleKeys.common_try_searching_for_something_else),
        ),
      );
    } else {
      emit(OrdersState.success(orders, filtered: filtered));
    }
  }

  // 🔄 Clear search results
  void clearSearch() {
    emit(OrdersState.success(orders));
  }
}
