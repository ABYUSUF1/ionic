part of 'shop_cubit.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState.initial() = _Initial;
  const factory ShopState.loading() = _Loading;
  const factory ShopState.loadingMore(List<Product> products) = _LoadingMore;
  const factory ShopState.error(String errMessage) = _Error;
  const factory ShopState.success(
    List<Product> products, {
    @Default(false) bool hasReachedMax,
  }) = _Success;
}
