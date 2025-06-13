// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      productItemModel: ProductItemModel.fromJson(
        json['productItemModel'] as Map<String, dynamic>,
      ),
      returnPolicy: json['returnPolicy'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'productItemModel': instance.productItemModel.toJson(),
      'returnPolicy': instance.returnPolicy,
      'quantity': instance.quantity,
    };
