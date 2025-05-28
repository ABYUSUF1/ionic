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

  List<ProductItemEntity> productsToProductItems() =>
      products.map((e) => e.toProductItem()).toList();
}
