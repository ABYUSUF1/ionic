import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductExtensions on Product {
  bool get isAvailable => stock != null && stock! > 0;

  String get formattedPrice => '\$${price?.toStringAsFixed(2) ?? '0.00'}';

  String get formattedDiscountPercentage =>
      '${discountPercentage?.toStringAsFixed(2) ?? '0.00'}%';

  ProductItemEntity toProductItem() {
    return ProductItemEntity(
      id: id.toString(),
      title: title ?? '',
      imageUrl: thumbnail ?? '',
      price: price ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      reviewsCount: reviews?.length ?? 0,
    );
  }
}
