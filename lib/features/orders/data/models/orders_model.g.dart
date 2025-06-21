// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersModelImpl _$$OrdersModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersModelImpl(
  orderId: json['orderId'] as String,
  userId: json['userId'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  address: json['address'] as String,
  products:
      (json['products'] as List<dynamic>)
          .map((e) => OrdersProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
  totalQuantity: (json['totalQuantity'] as num).toInt(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumEnumMap, json['paymentMethod']),
  deliveryInstructions: $enumDecode(
    _$DeliveryInstructionsEnumEnumMap,
    json['deliveryInstructions'],
  ),
  orderStatus: $enumDecode(_$OrderStatusEnumEnumMap, json['orderStatus']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  arrivedAt: DateTime.parse(json['arrivedAt'] as String),
);

Map<String, dynamic> _$$OrdersModelImplToJson(_$OrdersModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'totalQuantity': instance.totalQuantity,
      'paymentMethod': _$PaymentMethodEnumEnumMap[instance.paymentMethod]!,
      'deliveryInstructions':
          _$DeliveryInstructionsEnumEnumMap[instance.deliveryInstructions]!,
      'orderStatus': _$OrderStatusEnumEnumMap[instance.orderStatus]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'arrivedAt': instance.arrivedAt.toIso8601String(),
    };

const _$PaymentMethodEnumEnumMap = {
  PaymentMethodEnum.cod: 'cod',
  PaymentMethodEnum.paypal: 'paypal',
  PaymentMethodEnum.stripe: 'stripe',
  PaymentMethodEnum.paymob: 'paymob',
};

const _$DeliveryInstructionsEnumEnumMap = {
  DeliveryInstructionsEnum.leaveAtDoor: 'leaveAtDoor',
  DeliveryInstructionsEnum.handItToMe: 'handItToMe',
  DeliveryInstructionsEnum.callOnArrival: 'callOnArrival',
};

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'pending',
  OrderStatusEnum.confirmed: 'confirmed',
  OrderStatusEnum.shipped: 'shipped',
  OrderStatusEnum.delivered: 'delivered',
  OrderStatusEnum.cancelled: 'cancelled',
};
