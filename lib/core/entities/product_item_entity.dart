import '../models/product_item_model.dart';

class ProductItemEntity {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final double rating;
  final String brand;
  final int stock;
  final int reviewsCount;

  ProductItemEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.stock,
    required this.reviewsCount,
    required this.brand,
  });

  static ProductItemEntity loading() {
    return ProductItemEntity(
      id: '-1',
      title: 'Loading',
      imageUrl: '',
      price: 0.0,
      rating: 0.0,
      brand: "Brand",
      stock: 0,
      reviewsCount: 0,
    );
  }
}

extension ProductItemEntityExtension on ProductItemEntity {
  ProductItemModel toProductItemModel() {
    return ProductItemModel(
      id: id,
      title: title,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      stock: stock,
      reviewsCount: reviewsCount,
      brand: brand,
    );
  }
}
