// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersProductModelImpl _$$OrdersProductModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersProductModelImpl(
  productId: json['productId'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  brand: json['brand'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  returnPolicy: json['returnPolicy'] as String,
);

Map<String, dynamic> _$$OrdersProductModelImplToJson(
  _$OrdersProductModelImpl instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'brand': instance.brand,
  'price': instance.price,
  'quantity': instance.quantity,
  'returnPolicy': instance.returnPolicy,
};
