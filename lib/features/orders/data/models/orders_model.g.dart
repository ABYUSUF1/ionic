// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersModelImpl _$$OrdersModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersModelImpl(
  orderId: json['orderId'] as String,
  customerInfoModel: OrdersCustomerInfoModel.fromJson(
    json['customerInfoModel'] as Map<String, dynamic>,
  ),
  summaryModel: OrderSummaryModel.fromJson(
    json['summaryModel'] as Map<String, dynamic>,
  ),
  products:
      (json['products'] as List<dynamic>)
          .map((e) => OrdersProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumEnumMap, json['paymentMethod']),
  deliveryInstructions: $enumDecode(
    _$DeliveryInstructionsEnumEnumMap,
    json['deliveryInstructions'],
  ),
  orderStatus: $enumDecode(_$OrderStatusEnumEnumMap, json['orderStatus']),
  placedAt: DateTime.parse(json['placedAt'] as String),
  arrivedAt: DateTime.parse(json['arrivedAt'] as String),
);

Map<String, dynamic> _$$OrdersModelImplToJson(_$OrdersModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerInfoModel': instance.customerInfoModel.toJson(),
      'summaryModel': instance.summaryModel.toJson(),
      'products': instance.products.map((e) => e.toJson()).toList(),
      'paymentMethod': _$PaymentMethodEnumEnumMap[instance.paymentMethod]!,
      'deliveryInstructions':
          _$DeliveryInstructionsEnumEnumMap[instance.deliveryInstructions]!,
      'orderStatus': _$OrderStatusEnumEnumMap[instance.orderStatus]!,
      'placedAt': instance.placedAt.toIso8601String(),
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
