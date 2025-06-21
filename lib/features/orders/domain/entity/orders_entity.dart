import 'package:ionic/core/entities/order_summary_entity.dart';
import 'package:ionic/core/utils/enums/order_status_enum.dart';
import 'package:ionic/features/orders/data/models/orders_model.dart';
import 'package:ionic/features/orders/domain/entity/orders_customer_info.dart';
import 'package:ionic/features/orders/domain/entity/orders_product_entity.dart';

import '../../../../core/utils/enums/delivery_instructions_enum.dart';
import '../../../../core/utils/enums/payment_method_enum.dart';

class OrdersEntity {
  final String orderId;
  final OrdersCustomerInfoEntity customerInfoEntity;
  final OrderSummaryEntity summaryEntity;
  final List<OrdersProductEntity> products;
  final PaymentMethodEnum paymentMethod;
  final DeliveryInstructionsEnum deliveryInstructions;
  final OrderStatusEnum orderStatus;
  final DateTime placedAt;
  final DateTime arrivedAt;

  OrdersEntity({
    required this.orderId,
    required this.customerInfoEntity,
    required this.products,
    required this.summaryEntity,
    required this.paymentMethod,
    required this.deliveryInstructions,
    required this.orderStatus,
    required this.placedAt,
    required this.arrivedAt,
  });

  OrdersModel toModel() => OrdersModel(
    orderId: orderId,
    summaryModel: summaryEntity.toModel(),
    customerInfoModel: customerInfoEntity.toModel(),
    products: products.map((e) => e.toModel()).toList(),
    paymentMethod: paymentMethod,
    deliveryInstructions: deliveryInstructions,
    orderStatus: orderStatus,
    placedAt: placedAt,
    arrivedAt: arrivedAt,
  );

  static OrdersEntity loading() => OrdersEntity(
    orderId: '123456789ABCDEFG',
    customerInfoEntity: OrdersCustomerInfoEntity.loading(),
    summaryEntity: OrderSummaryEntity.loading(),
    products: [OrdersProductEntity.loading()],
    paymentMethod: PaymentMethodEnum.cod,
    deliveryInstructions: DeliveryInstructionsEnum.callOnArrival,
    orderStatus: OrderStatusEnum.pending,
    placedAt: DateTime.now(),
    arrivedAt: DateTime.now(),
  );

  // copyWith
  OrdersEntity copyWith({
    String? orderId,
    PaymentMethodEnum? paymentMethod,
    DeliveryInstructionsEnum? deliveryInstructions,
    OrderStatusEnum? orderStatus,
    DateTime? placedAt,
    DateTime? arrivedAt,
  }) {
    return OrdersEntity(
      orderId: orderId ?? this.orderId,
      customerInfoEntity: customerInfoEntity,
      summaryEntity: summaryEntity,
      products: products,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      orderStatus: orderStatus ?? this.orderStatus,
      placedAt: placedAt ?? this.placedAt,
      arrivedAt: arrivedAt ?? this.arrivedAt,
    );
  }
}
