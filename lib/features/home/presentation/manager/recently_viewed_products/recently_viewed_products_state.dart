part of 'recently_viewed_products_cubit.dart';

@freezed
class RecentlyViewedProductsState with _$RecentlyViewedProductsState {
  const factory RecentlyViewedProductsState.initial() = _Initial;
  const factory RecentlyViewedProductsState.loading() = _Loading;
  const factory RecentlyViewedProductsState.error(String errMessage) = _Error;
  const factory RecentlyViewedProductsState.success(
    List<ProductItemEntity> productsItem,
  ) = _Success;
}
