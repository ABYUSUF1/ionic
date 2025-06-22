part of 'recently_products_cubit.dart';

@freezed
class RecentlyProductsState with _$RecentlyProductsState {
  const factory RecentlyProductsState.initial() = _Initial;
  const factory RecentlyProductsState.loading() = _Loading;
  const factory RecentlyProductsState.error(String errMessage) = _Error;
  const factory RecentlyProductsState.success(
    List<ProductItemEntity> productsItem,
  ) = _Success;
}
