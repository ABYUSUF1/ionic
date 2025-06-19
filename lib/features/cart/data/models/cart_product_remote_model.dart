import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/product_item_model.dart';

part 'cart_product_remote_model.freezed.dart';
part 'cart_product_remote_model.g.dart';

@freezed
class CartProductRemoteModel with _$CartProductRemoteModel {
  @JsonSerializable(explicitToJson: true)
  const factory CartProductRemoteModel({
    required ProductItemModel productItem,
    required String returnPolicy,
    required int quantity,
  }) = _CartProductRemoteModel;

  factory CartProductRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductRemoteModelFromJson(json);
}
