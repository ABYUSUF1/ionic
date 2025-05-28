part of 'home_categories_cubit.dart';

@freezed
class HomeCategoriesState with _$HomeCategoriesState {
  const factory HomeCategoriesState.initial() = _Initial;
  const factory HomeCategoriesState.loading(
    List<CategoryEntity> loadingCategories,
  ) = _Loading;
  const factory HomeCategoriesState.success(List<CategoryEntity> categories) =
      _Success;
  const factory HomeCategoriesState.error() = _Error;
}
