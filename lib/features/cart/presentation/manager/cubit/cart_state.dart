part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success(List<CartEntity> cartEntity) = _Success;
  const factory CartState.error(String errMessage) = _Error;
  const factory CartState.empty() = _Empty;
}

extension CartStateExt on CartState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isSuccess => this is _Success;
  bool get isError => this is _Error;
  bool get isEmpty => this is _Empty;
}
