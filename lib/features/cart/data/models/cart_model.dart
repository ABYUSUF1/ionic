import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/cart_entity.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required String productId,
    required String title,
    required String imageUrl,
    required String brand,
    required double price,
    required double discount,
    required String returnPolicy,
    required int deliveryDays,
    required int quantity,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelExtension on CartModel {
  CartEntity toEntity() => CartEntity(
    productId: productId,
    title: title,
    imageUrl: imageUrl,
    brand: brand,
    price: price,
    discount: discount,
    returnPolicy: returnPolicy,
    deliveryDays: deliveryDays,
    quantity: quantity,
  );
}
