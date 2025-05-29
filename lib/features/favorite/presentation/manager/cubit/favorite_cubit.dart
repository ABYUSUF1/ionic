import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/favorite/domain/repo/favorite_repo.dart';

import '../../../../../core/entities/product_item_entity.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;

  FavoriteCubit(this._favoriteRepo) : super(const FavoriteState.initial()) {
    fetchFavorites();
  }

  // Stores current list of favorites in memory
  List<ProductItemEntity> favorites = <ProductItemEntity>[];

  /// Fetch favorites
  Future<void> fetchFavorites() async {
    emit(const FavoriteState.loading());

    final result = await _favoriteRepo.fetchFavorites();

    result.fold((failure) => emit(FavoriteState.error(failure.errMessage)), (
      products,
    ) {
      favorites = List<ProductItemEntity>.from(products);
      emit(FavoriteState.success(products));
    });
  }

  // Lock to prevent rapid multi-tap toggling
  bool _isToggling = false;

  /// Toggle favorite status of a product (add or remove)
  /// UI updates immediately; repo operation runs without await for responsiveness
  void toggleFavorites(ProductItemEntity productItemEntity) {
    if (_isToggling) return;
    _isToggling = true;

    final isFav = favorites.contains(productItemEntity);

    if (isFav) {
      _favoriteRepo.removeFavorite(productItemEntity.id); // Optimistic removal
      favorites.remove(productItemEntity);
    } else {
      _favoriteRepo.addFavorite(productItemEntity); // Optimistic addition
      favorites.add(productItemEntity);
    }

    emit(FavoriteState.success(List.from(favorites))); // Re-emit updated list
    _isToggling = false;
  }

  /// Check if a product is currently favorited
  bool isFavorite(ProductItemEntity productItemEntity) {
    return favorites.contains(productItemEntity);
  }
}
