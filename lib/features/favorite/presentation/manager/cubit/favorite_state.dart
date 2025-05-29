part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.success(List<ProductItemEntity> products) =
      _Success;
  const factory FavoriteState.error(String errMessage) = _Error;
}
