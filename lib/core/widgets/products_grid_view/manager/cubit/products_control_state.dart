import 'package:ionic/core/entities/product_item_entity.dart';

import 'products_control_cubit.dart';

class ProductsControlState {
  List<ProductItemEntity> originalProductItems;
  List<ProductItemEntity> filteredProducts;
  double minPrice;
  double maxPrice;
  Set<String> selectedBrands;
  Set<String> allBrands;
  double currentRating;
  SortOption currentSort;

  ProductsControlState({
    required this.originalProductItems,
    required this.filteredProducts,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedBrands,
    required this.allBrands,
    required this.currentRating,
    required this.currentSort,
  });

  ProductsControlState copyWith({
    List<ProductItemEntity>? originalProductItems,
    List<ProductItemEntity>? filteredProducts,
    double? minPrice,
    double? maxPrice,
    Set<String>? allBrands,
    Set<String>? selectedBrands,
    double? currentRating,
    SortOption? currentSort,
  }) {
    return ProductsControlState(
      originalProductItems: originalProductItems ?? this.originalProductItems,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      allBrands: allBrands ?? this.allBrands,
      selectedBrands: selectedBrands ?? this.selectedBrands,
      currentRating: currentRating ?? this.currentRating,
      currentSort: currentSort ?? this.currentSort,
    );
  }
}
