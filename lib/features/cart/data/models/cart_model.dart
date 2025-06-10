import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/cart/data/models/cart_product.dart';

import '../../domain/entity/cart_entity.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required String cartId,
    required List<CartProduct> cartProducts,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelExtension on CartModel {
  // toEntity
  CartEntity toEntity() =>
      CartEntity(cartId: cartId, cartProducts: cartProducts);
}
