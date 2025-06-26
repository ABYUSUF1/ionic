import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/generated/locale_keys.g.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo _ordersRepo;

  OrdersCubit(this._ordersRepo) : super(const OrdersState.initial());

  List<OrdersEntity> _orders = [];
  bool _fetched = false;

  List<OrdersEntity> get allOrders => _orders;

  // 🔄 Fetch Orders
  Future<void> fetchOrders() async {
    if (_fetched) {
      if (_orders.isEmpty) {
        emit(OrdersState.empty(LocaleKeys.orders_empty_desc.tr()));
      } else {
        _emitSuccess();
      }
      return;
    }

    emit(const OrdersState.loading());

    final result = await _ordersRepo.fetchOrders();

    result.fold((failure) => emit(OrdersState.error(failure.errMessage)), (
      fetched,
    ) {
      _orders = List.unmodifiable(fetched);
      _fetched = true;

      if (_orders.isEmpty) {
        emit(OrdersState.empty(LocaleKeys.orders_empty_desc.tr()));
      } else {
        _emitSuccess();
      }
    });
  }

  // ➕ Add Order
  Future<void> addOrder(OrdersEntity newOrder) async {
    emit(const OrdersState.loading());

    final result = await _ordersRepo.addOrder(newOrder);

    result.fold((failure) => emit(OrdersState.error(failure.errMessage)), (
      orderId,
    ) {
      final newOrderWithId = newOrder.copyWith(orderId: orderId);
      _orders = List.unmodifiable([..._orders, newOrderWithId]);
      _fetched = true;
      _emitSuccess();
    });
  }

  // 🔍 Search
  void search(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      _emitSuccess(); // Reset
      return;
    }

    final lowerQuery = trimmed.toLowerCase();

    final filtered =
        _orders.where((order) {
          final matchesProduct = order.products.any(
            (product) => product.name.toLowerCase().contains(lowerQuery),
          );

          final matchesDate = DateFormat(
            'yyyy-MM-dd',
          ).format(order.placedAt).toLowerCase().contains(lowerQuery);

          return matchesProduct || matchesDate;
        }).toList();

    if (filtered.isEmpty) {
      emit(
        OrdersState.empty(
          LocaleKeys.common_try_searching_for_something_else.tr(),
        ),
      );
    } else {
      emit(OrdersState.success(_orders, filtered: filtered));
    }
  }

  // 🔄 Clear Search
  void clearSearch() {
    _emitSuccess();
  }

  // 🧠 Internal: Emit success state
  void _emitSuccess() {
    emit(OrdersState.success(_orders));
  }
}
