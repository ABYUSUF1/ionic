import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/utils/functions/product_formatted.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

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
      brand: 'loading',
      images: [],
      tags: ["loading", "loading", "loading"],
      description: "loading description here .....",
      category: "loading",
      discountPercentage: 0.0,
      sku: "loading",
      weight: 0,
      shippingInformation: "loading",
      warrantyInformation: "loading",
      availabilityStatus: "loading",
      minimumOrderQuantity: 0,
      returnPolicy: "loading",
    );
  }
}

extension ProductExtension on Product {
  ProductItemEntity toProductItem() {
    return ProductItemEntity(
      productId: id?.toString() ?? '',
      title: title ?? '',
      imageUrl: thumbnail ?? '',
      price: price ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      reviewsCount: reviews?.length ?? 0,
      brand: brand ?? '',
      discount: discountPercentage ?? 0.0,
      deliveryDays: deliveryDays(shippingInformation),
    );
  }

  CartProductEntity toCartProduct(int quantity) {
    return CartProductEntity(
      productItem: toProductItem(),
      returnPolicy: returnPolicy ?? '',
      quantity: quantity,
    );
  }
}
