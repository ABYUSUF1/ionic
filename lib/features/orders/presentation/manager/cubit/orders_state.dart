part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.success(
    List<OrdersEntity> allOrders, {
    List<OrdersEntity>? filtered,
  }) = _Success;
  const factory OrdersState.empty(String message) = _Empty;
  const factory OrdersState.error(String message) = _Error;
}

extension OrdersStateX on OrdersState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
