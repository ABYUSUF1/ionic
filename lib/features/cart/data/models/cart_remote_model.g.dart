// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartRemoteModelImpl _$$CartRemoteModelImplFromJson(
  Map<String, dynamic> json,
) => _$CartRemoteModelImpl(
  cartProducts:
      (json['cartProducts'] as List<dynamic>)
          .map(
            (e) => CartProductRemoteModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$CartRemoteModelImplToJson(
  _$CartRemoteModelImpl instance,
) => <String, dynamic>{
  'cartProducts': instance.cartProducts.map((e) => e.toJson()).toList(),
};
