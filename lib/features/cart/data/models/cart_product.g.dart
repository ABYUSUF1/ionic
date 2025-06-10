// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductImpl _$$CartProductImplFromJson(Map<String, dynamic> json) =>
    _$CartProductImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      returnPolicy: json['returnPolicy'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartProductImplToJson(_$CartProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'brand': instance.brand,
      'price': instance.price,
      'discount': instance.discount,
      'returnPolicy': instance.returnPolicy,
      'quantity': instance.quantity,
    };
