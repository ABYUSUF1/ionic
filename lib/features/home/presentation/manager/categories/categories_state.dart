part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading(
    List<CategoryEntity> loadingCategories,
  ) = _Loading;
  const factory CategoriesState.success(List<CategoryEntity> categories) =
      _Success;
  const factory CategoriesState.error() = _Error;
}
