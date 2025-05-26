import 'package:ionic/core/models/product_model/product.dart';

class ProductsEntity {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductsEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
