class ProductItemEntity {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final double rating;
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
  });

  static ProductItemEntity loading() {
    return ProductItemEntity(
      id: '-1',
      title: 'Loading',
      imageUrl: '',
      price: 0.0,
      rating: 0.0,
      stock: 0,
      reviewsCount: 0,
    );
  }
}
