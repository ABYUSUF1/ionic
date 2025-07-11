part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.success(
    Product product, {
    @Default(1) int quantity,
  }) = _Success;
  const factory ProductState.error(String errMessage) = _Error;
}
