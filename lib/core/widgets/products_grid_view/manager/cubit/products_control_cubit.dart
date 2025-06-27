import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import 'products_control_state.dart';

enum SortOption { recommended, lowToHigh, highToLow, topRated }

class ProductsControlCubit extends Cubit<ProductsControlState> {
  ProductsControlCubit()
    : super(
        ProductsControlState(
          originalProductItems: [],
          filteredProducts: [],
          minPrice: 0,
          maxPrice: 2000,
          allBrands: {},
          selectedBrands: {},
          currentRating: 0,
          currentSort: SortOption.recommended,
        ),
      );

  // Must be called whenever source product list changes (e.g., favorites change)
  void updateProducts(List<ProductItemEntity> products) {
    final uniqueBrands = products.map((e) => e.brand).toSet();
    emit(
      state.copyWith(
        originalProductItems: products,
        allBrands: uniqueBrands, // <-- key part
        selectedBrands: uniqueBrands, // if you want all initially active
      ),
    );
    filterProducts();
  }

  /// Filters logic .................................................
  void setPriceRange(double newMinPrice, double newMaxPrice) {
    state.minPrice = newMinPrice;
    state.maxPrice = newMaxPrice;
    filterProducts();
  }

  void toggleBrand(String brand) {
    final newSelectedBrands = Set<String>.from(
      state.selectedBrands,
    ); // Create a copy
    if (newSelectedBrands.contains(brand)) {
      newSelectedBrands.remove(brand); // Deselect
    } else {
      newSelectedBrands.add(brand); // Select
    }
    state.selectedBrands = newSelectedBrands; // Update state
    filterProducts();
  }

  void setRating(double rating) {
    state.currentRating = rating;
    filterProducts();
  }

  void filterProducts() {
    // First apply filters
    var filteredProducts =
        state.originalProductItems.where((product) {
          final matchesPrice =
              product.price >= state.minPrice &&
              product.price <= state.maxPrice;
          final matchesBrand =
              state.selectedBrands.isEmpty ||
              state.selectedBrands.contains(product.brand);
          final matchesRating = product.rating >= state.currentRating;
          return matchesPrice && matchesBrand && matchesRating;
        }).toList();

    // Then apply sorting
    switch (state.currentSort) {
      case SortOption.recommended:
        break;
      case SortOption.lowToHigh:
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.highToLow:
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.topRated:
        filteredProducts.sort((a, b) => (b.rating).compareTo(a.rating));
        break;
    }

    emit(
      state.copyWith(
        filteredProducts: filteredProducts,
        minPrice: state.minPrice,
        maxPrice: state.maxPrice,
        selectedBrands: state.selectedBrands,
        currentRating: state.currentRating,
        currentSort: state.currentSort,
      ),
    );
  }

  /// Sort
  void setSortOption(SortOption option) {
    state.currentSort = option;
    filterProducts(); // This will trigger a re-sort
  }

  /// Search with debouncing
  Timer? _searchDebounce;

  void searchProducts(String query) {
    // Cancel previous timer if it exists
    _searchDebounce?.cancel();

    // Start a new timer
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      final filteredProducts =
          state.originalProductItems.where((product) {
            return product.title.toLowerCase().contains(query.toLowerCase());
          }).toList();

      emit(
        state.copyWith(
          filteredProducts: filteredProducts,
          minPrice: state.minPrice,
          maxPrice: state.maxPrice,
          selectedBrands: state.selectedBrands,
          currentRating: state.currentRating,
          currentSort: state.currentSort,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
