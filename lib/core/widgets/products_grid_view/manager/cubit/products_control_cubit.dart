import 'package:bloc/bloc.dart';
import 'package:ionic/core/entities/products_entity.dart';

enum SortOption { recommended, lowToHigh, highToLow, topRated }

class ProductsControlCubit extends Cubit<ProductsEntity> {
  ProductsControlCubit(ProductsEntity initialProducts)
    : super(initialProducts) {
    originalProducts = initialProducts;
    allBrands = initialProducts.getBrands();
    selectedBrands = allBrands;
  }

  ProductsEntity originalProducts = ProductsEntity.loading();

  // Filters
  double minPrice = 0;
  double maxPrice = 2000;
  Set<String> selectedBrands = {};
  Set<String> allBrands = {};
  double currentRating = 1.0;

  SortOption currentSort = SortOption.recommended;

  /// Filters logic .................................................

  void setPriceRange(double newMinPrice, double newMaxPrice) {
    minPrice = newMinPrice;
    maxPrice = newMaxPrice;
    filterProducts();
  }

  void toggleBrand(String brand) {
    final newSelectedBrands = Set<String>.from(selectedBrands); // Create a copy
    if (newSelectedBrands.contains(brand)) {
      newSelectedBrands.remove(brand); // Deselect
    } else {
      newSelectedBrands.add(brand); // Select
    }
    selectedBrands = newSelectedBrands; // Update state
    filterProducts();
  }

  void setRating(double rating) {
    currentRating = rating;
    filterProducts();
  }

  void filterProducts() {
    // First apply filters
    var filteredProducts =
        originalProducts.products.where((product) {
          final matchesPrice =
              product.price! >= minPrice && product.price! <= maxPrice;
          final matchesBrand =
              selectedBrands.isEmpty || selectedBrands.contains(product.brand);
          final matchesRating =
              product.rating != null && product.rating! >= currentRating;
          return matchesPrice && matchesBrand && matchesRating;
        }).toList();

    // Then apply sorting
    switch (currentSort) {
      case SortOption.recommended:
        break;
      case SortOption.lowToHigh:
        filteredProducts.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case SortOption.highToLow:
        filteredProducts.sort((a, b) => b.price!.compareTo(a.price!));
        break;
      case SortOption.topRated:
        filteredProducts.sort(
          (a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0),
        );
        break;
    }

    emit(
      state.copyWith(
        products: filteredProducts,
        total: filteredProducts.length,
      ),
    );
  }

  /// Sort
  void setSortOption(SortOption option) {
    currentSort = option;
    filterProducts(); // This will trigger a re-sort
  }
}
