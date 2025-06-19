// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductRemoteModelImpl _$$CartProductRemoteModelImplFromJson(
  Map<String, dynamic> json,
) => _$CartProductRemoteModelImpl(
  productItem: ProductItemModel.fromJson(
    json['productItem'] as Map<String, dynamic>,
  ),
  returnPolicy: json['returnPolicy'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$$CartProductRemoteModelImplToJson(
  _$CartProductRemoteModelImpl instance,
) => <String, dynamic>{
  'productItem': instance.productItem.toJson(),
  'returnPolicy': instance.returnPolicy,
  'quantity': instance.quantity,
};
