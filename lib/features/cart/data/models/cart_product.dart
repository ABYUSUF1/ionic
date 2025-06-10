import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required String id,
    required String title,
    required String imageUrl,
    required String brand,
    required double price,
    required double discount,
    required String returnPolicy,
    required int quantity,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
