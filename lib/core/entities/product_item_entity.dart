import '../models/product_item_model.dart';

class ProductItemEntity {
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final double discount;
  final String brand;
  final double rating;
  final int stock;
  final int reviewsCount;
  final int deliveryDays;

  ProductItemEntity({
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.stock,
    required this.reviewsCount,
    required this.brand,
    required this.discount,
    required this.deliveryDays,
  });

  static ProductItemEntity loading() {
    return ProductItemEntity(
      productId: '-1',
      title: 'Loading',
      imageUrl: '',
      price: 0.0,
      rating: 0.0,
      brand: "Brand",
      stock: 0,
      reviewsCount: 0,
      discount: 0.0,
      deliveryDays: 0,
    );
  }
}

extension ProductItemEntityExtension on ProductItemEntity {
  ProductItemModel toProductItemModel() {
    return ProductItemModel(
      productId: productId,
      title: title,
      imageUrl: imageUrl,
      price: price,
      discount: discount,
      rating: rating,
      stock: stock,
      reviewsCount: reviewsCount,
      brand: brand,
      deliveryDays: deliveryDays,
    );
  }
}
