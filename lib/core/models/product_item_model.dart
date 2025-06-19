import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../entities/product_item_entity.dart';

part 'product_item_model.freezed.dart';
part 'product_item_model.g.dart';

@Freezed(addImplicitFinal: false)
class ProductItemModel with _$ProductItemModel {
  @Entity(realClass: ProductItemModel)
  factory ProductItemModel({
    @Id() @Default(0) int obxId,
    required String productId,
    required String title,
    required String imageUrl,
    required double price,
    required double discount,
    required String brand,
    required double rating,
    required int stock,
    required int reviewsCount,
    required int deliveryDays,
  }) = _ProductItemModel;

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProductItemModelFromJson(json);
}

extension ProductItemModelExtension on ProductItemModel {
  ProductItemEntity toEntity() {
    return ProductItemEntity(
      productId: productId,
      title: title,
      imageUrl: imageUrl,
      price: price,
      discount: discount,
      brand: brand,
      rating: rating,
      stock: stock,
      reviewsCount: reviewsCount,
      deliveryDays: deliveryDays,
    );
  }
}
