part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.recentSearches(List<ProductItemEntity> products) =
      _RecentSearches;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.error(String message) = _Error;
  const factory SearchState.resultSearches(
    ProductsEntity productsEntity, {
    @Default(false) bool isPaginating,
  }) = _ResultSearches;
}
