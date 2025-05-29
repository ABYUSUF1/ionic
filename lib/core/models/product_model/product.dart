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

  static Product loading() {
    return Product(
      id: -1,
      title: 'Loading',
      thumbnail: '',
      price: 0.0,
      rating: 0.0,
      stock: 0,
      reviews: [],
    );
  }
}

extension ProductExtensions on Product {
  bool get isAvailable => stock != null && stock! > 0;

  String get formattedPrice => price?.toStringAsFixed(2) ?? '0.00';

  String get formattedDiscountPercentage =>
      '- ${discountPercentage?.toStringAsFixed(2) ?? '0.00'}%';

  String get formattedPriceBeforeDiscount {
    if (discountPercentage != null && discountPercentage! > 0) {
      final discountedPrice = price! / (1 - discountPercentage! / 100);
      return discountedPrice.toStringAsFixed(2);
    }
    return formattedPrice;
  }

  String get formattedStock {
    if (stock == null) return 'N/A';
    if (stock! > 0) {
      return stock! > 10 ? '$stock in stock' : 'Only $stock in stock';
    } else {
      return 'Out of stock';
    }
  }

  String get formattedWeight => weight != null ? '$weight g' : 'N/A';
  String get formattedDimensions =>
      dimensions != null
          ? '${dimensions!.depth} x ${dimensions!.width} x ${dimensions!.height} cm'
          : 'N/A';

  ProductItemEntity toProductItem() {
    return ProductItemEntity(
      id: id.toString(),
      title: title ?? '',
      imageUrl: thumbnail ?? '',
      price: price ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      reviewsCount: reviews?.length ?? 0,
      brand: brand ?? '',
    );
  }
}
