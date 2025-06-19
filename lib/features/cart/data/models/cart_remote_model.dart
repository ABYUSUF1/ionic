import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/cart/data/models/cart_product_remote_model.dart';

part 'cart_remote_model.freezed.dart';
part 'cart_remote_model.g.dart';

@freezed
class CartRemoteModel with _$CartRemoteModel {
  @JsonSerializable(explicitToJson: true)
  const factory CartRemoteModel({
    required List<CartProductRemoteModel> cartProducts,
  }) = _CartRemoteModel;

  factory CartRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CartRemoteModelFromJson(json);
}
