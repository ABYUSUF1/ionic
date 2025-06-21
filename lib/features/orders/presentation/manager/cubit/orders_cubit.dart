import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(const OrdersState.initial());

  List<OrdersEntity> orders = [];

  bool get isOrdersFetched => orders.isNotEmpty;

  // 🔄 Fetch all orders
  Future<void> fetchOrders() async {
    emit(const OrdersState.loading());

    final result = await ordersRepo.fetchOrders();

    result.fold((failure) => emit(OrdersState.error(failure.errMessage)), (
      fetchedOrders,
    ) {
      orders = fetchedOrders;

      if (orders.isEmpty) {
        emit(const OrdersState.empty("You don't have any orders yet"));
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
  void onSearchChanged(String query) {
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
      emit(const OrdersState.empty("Try searching for something else"));
    } else {
      emit(OrdersState.success(orders, filtered: filtered));
    }
  }

  // 🔄 Clear search results
  void clearSearch() {
    emit(OrdersState.success(orders));
  }
}
