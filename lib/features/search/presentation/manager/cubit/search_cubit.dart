import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/features/search/domain/repo/search_repo.dart';
import '../../../../../core/models/product_model/product.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(const SearchState.initial()) {
    getRecentSearches();
  }

  final TextEditingController searchController = TextEditingController();
  Timer? _debounceSearch;

  ProductsEntity _productsEntity = ProductsEntity(
    products: [],
    total: 0,
    skip: 0,
    limit: 20,
  );

  List<ProductItemEntity> recentSearches = [];
  bool _isLoadingMore = false;

  void onSearchChange(String query, {bool isLoadMore = false}) {
    if (isLoadMore) {
      if (_isLoadingMore ||
          _productsEntity.products.length >= _productsEntity.total) {
        return;
      }
    } else {
      _productsEntity = _productsEntity.copyWith(products: [], skip: 0);
    }

    _debounceSearch?.cancel();
    _debounceSearch = Timer(
      const Duration(milliseconds: 500),
      () => _search(query, isLoadMore: isLoadMore),
    );
  }

  Future<void> _search(String query, {bool isLoadMore = false}) async {
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    try {
      if (isLoadMore) {
        _isLoadingMore = true;
        emit(SearchState.resultSearches(_productsEntity, isPaginating: true));
      } else {
        emit(const SearchState.loading());
      }

      final result = await _searchRepo.search(
        query,
        _productsEntity.limit,
        _productsEntity.skip,
      );

      result.fold((failure) => emit(SearchState.error(failure.errMessage)), (
        newData,
      ) {
        final updatedProducts = List<Product>.from(_productsEntity.products)
          ..addAll(
            newData.products.where(
              (newProduct) =>
                  !_productsEntity.products.any((p) => p.id == newProduct.id),
            ),
          );

        _productsEntity = _productsEntity.copyWith(
          products: updatedProducts,
          total: newData.total,
          skip: _productsEntity.skip + _productsEntity.limit,
        );

        emit(SearchState.resultSearches(_productsEntity));
      });
    } finally {
      if (isLoadMore) _isLoadingMore = false;
    }
  }

  void clearSearch() {
    _debounceSearch?.cancel();
    searchController.clear();
    _productsEntity = ProductsEntity(
      products: [],
      total: 0,
      skip: 0,
      limit: 20,
    );
    emit(SearchState.recentSearches(recentSearches));
  }

  void addRecentSearch(Product product) {
    final item = product.toProductItem();

    // Remove if already exists
    recentSearches.removeWhere((e) => e.productId == item.productId);

    // Insert at the top
    recentSearches.insert(0, item);

    // Keep only 10 items
    if (recentSearches.length > 10) {
      final removed = recentSearches.removeLast();
      _searchRepo.deleteRecentSearches(removed); // remove overflow from storage
    }

    _searchRepo.addRecentSearches(item);
  }

  void deleteRecentSearch(Product product) {
    final id = product.id!;
    recentSearches.removeWhere((e) => e.productId == id.toString());
    _searchRepo.deleteRecentSearches(product.toProductItem());
    emit(SearchState.recentSearches(recentSearches));
  }

  void getRecentSearches() {
    recentSearches = _searchRepo.getRecentSearches();
    emit(SearchState.recentSearches(recentSearches));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    _debounceSearch?.cancel();
    return super.close();
  }
}
