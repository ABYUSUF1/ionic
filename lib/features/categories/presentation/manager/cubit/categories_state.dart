part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading(ProductsEntity loadingProductsEntity) =
      _Loading;
  const factory CategoriesState.success(ProductsEntity productsEntity) =
      _Success;
  const factory CategoriesState.error(String errMessage) = _Error;
}
