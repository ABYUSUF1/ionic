part of 'popular_products_cubit.dart';

@freezed
class PopularProductsState with _$PopularProductsState {
  const factory PopularProductsState.initial() = _Initial;
  const factory PopularProductsState.loading() = _Loading;
  const factory PopularProductsState.success(ProductsEntity productsEntity) =
      _Success;
  const factory PopularProductsState.error(String errMessage) = _Error;
}
