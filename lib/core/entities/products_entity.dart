import 'package:ionic/core/entities/product_item_entity.dart';
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

  static ProductsEntity loading() => ProductsEntity(
    products: [Product.loading()],
    total: 0,
    skip: 0,
    limit: 0,
  );
}

extension ProductsEntityExtension on ProductsEntity {
  bool get hasMore => skip + limit < total;

  Set<String> getBrands() =>
      products.map((e) => e.brand).whereType<String>().toSet();

  List<ProductItemEntity> productsToProductItems() =>
      products.map((e) => e.toProductItem()).toList();

  ProductsEntity copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) => ProductsEntity(
    products: products ?? this.products,
    total: total ?? this.total,
    skip: skip ?? this.skip,
    limit: limit ?? this.limit,
  );
}
