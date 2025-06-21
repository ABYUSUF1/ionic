// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSummaryModelImpl _$$OrderSummaryModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderSummaryModelImpl(
  totalQuantity: (json['totalQuantity'] as num).toInt(),
  subtotal: (json['subtotal'] as num).toDouble(),
  totalFees: (json['totalFees'] as num).toDouble(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
  totalDiscountedPrice: (json['totalDiscountedPrice'] as num).toDouble(),
);

Map<String, dynamic> _$$OrderSummaryModelImplToJson(
  _$OrderSummaryModelImpl instance,
) => <String, dynamic>{
  'totalQuantity': instance.totalQuantity,
  'subtotal': instance.subtotal,
  'totalFees': instance.totalFees,
  'totalPrice': instance.totalPrice,
  'totalDiscountedPrice': instance.totalDiscountedPrice,
};
