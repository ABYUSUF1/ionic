// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      cartId: json['cartId'] as String,
      cartProducts:
          (json['cartProducts'] as List<dynamic>)
              .map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'cartProducts': instance.cartProducts,
    };
