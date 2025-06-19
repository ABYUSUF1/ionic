part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.error(String errMessage) = _Error;
  const factory OrdersState.success(List<OrdersEntity> orders) = _Success;
}
