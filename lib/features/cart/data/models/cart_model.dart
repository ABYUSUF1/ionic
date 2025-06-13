import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/models/product_item_model.dart';

import '../../domain/entity/cart_entity.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  // Use `explicitToJson: true` to ensure nested objects like `ProductItemModel`
  // are properly serialized using their own `toJson()` methods when calling
  // `CartModel.toJson()`. This prevents missing serialization of nested fields.

  /// you should also use invalid_annotation_target: ignore to ignore this error
  @JsonSerializable(explicitToJson: true)
  const factory CartModel({
    required ProductItemModel productItemModel,
    required String returnPolicy,
    required int quantity,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelExtension on CartModel {
  CartEntity toEntity() => CartEntity(
    productItemEntity: productItemModel.toProductItemEntity(),
    returnPolicy: returnPolicy,
    quantity: quantity,
  );
}
