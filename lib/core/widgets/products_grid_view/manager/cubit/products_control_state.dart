import 'package:ionic/core/entities/product_item_entity.dart';

import 'products_control_cubit.dart';

class ProductsControlState {
  final List<ProductItemEntity> originalProductItems;
  List<ProductItemEntity> filteredProducts;
  double minPrice;
  double maxPrice;
  Set<String> selectedBrands;
  final Set<String> allBrands;
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
    List<ProductItemEntity>? filteredProducts,
    double? minPrice,
    double? maxPrice,
    Set<String>? selectedBrands,
    double? currentRating,
    SortOption? currentSort,
  }) {
    return ProductsControlState(
      originalProductItems: originalProductItems,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      allBrands: allBrands,
      selectedBrands: selectedBrands ?? this.selectedBrands,
      currentRating: currentRating ?? this.currentRating,
      currentSort: currentSort ?? this.currentSort,
    );
  }
}
