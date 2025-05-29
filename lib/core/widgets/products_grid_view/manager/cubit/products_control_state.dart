import '../../../../models/product_model/product.dart';
import 'products_control_cubit.dart';

class ProductsControlState {
  final List<Product> originalProducts;
  final List<Product> filteredProducts;
  final double minPrice;
  final double maxPrice;
  final Set<String> selectedBrands;
  final double currentRating;
  final SortOption currentSort;

  ProductsControlState({
    required this.originalProducts,
    required this.filteredProducts,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedBrands,
    required this.currentRating,
    required this.currentSort,
  });

  ProductsControlState copyWith({
    List<Product>? originalProducts,
    List<Product>? filteredProducts,
    double? minPrice,
    double? maxPrice,
    Set<String>? selectedBrands,
    double? currentRating,
    SortOption? currentSort,
  }) {
    return ProductsControlState(
      originalProducts: originalProducts ?? this.originalProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedBrands: selectedBrands ?? this.selectedBrands,
      currentRating: currentRating ?? this.currentRating,
      currentSort: currentSort ?? this.currentSort,
    );
  }
}
