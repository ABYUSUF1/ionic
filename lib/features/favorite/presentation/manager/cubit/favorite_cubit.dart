import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/favorite/domain/repo/favorite_repo.dart';

import '../../../../../core/entities/product_item_entity.dart';
import '../../../../../generated/locale_keys.g.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> with AuthGuardMixin {
  final FavoriteRepo _favoriteRepo;

  FavoriteCubit(this._favoriteRepo) : super(const FavoriteState.initial()) {
    fetchFavorites();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Stores current list of favorites in memory
  List<ProductItemEntity> favorites = <ProductItemEntity>[];
  Set<String> favoriteIds = <String>{};

  /// Fetch favorites
  Future<void> fetchFavorites() async {
    emit(const FavoriteState.loading());

    final result = await _favoriteRepo.fetchFavorites();

    result.fold((failure) => emit(FavoriteState.error(failure.errMessage)), (
      products,
    ) {
      favorites = List<ProductItemEntity>.from(products);
      favoriteIds = Set<String>.from(products.map((e) => e.productId));
      emit(FavoriteState.success(products));
    });
  }

  // Lock to prevent rapid multi-tap toggling
  bool _isToggling = false;

  /// Toggle favorite status of a product (add or remove)
  /// UI updates immediately; repo operation runs without await for responsiveness
  void toggleFavorites(
    ProductItemEntity productItemEntity,
    BuildContext context,
  ) {
    if (_isToggling) return;
    _isToggling = true;

    if (isFavorite(productItemEntity.productId)) {
      _favoriteRepo.removeFavorite(
        productItemEntity.productId,
      ); // Optimistic removal
      favorites.remove(productItemEntity);
      AppSnackbar.showNoteSnackBar(
        context,
        context.tr(LocaleKeys.favorites_removed_from_favorites),
      );
    } else {
      _favoriteRepo.addFavorite(productItemEntity); // Optimistic addition
      favorites.add(productItemEntity);
      AppSnackbar.showNoteSnackBar(
        context,
        context.tr(LocaleKeys.favorites_added_to_favorites),
      );
    }

    favoriteIds = Set<String>.from(favorites.map((e) => e.productId));
    emit(FavoriteState.success(List.from(favorites))); // Re-emit updated list
    _isToggling = false;
  }

  /// Check if a product is currently favorited
  bool isFavorite(String productId) {
    return favoriteIds.contains(productId);
  }
}
