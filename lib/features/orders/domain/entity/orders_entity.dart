import 'package:ionic/core/utils/enums/order_status_enum.dart';
import 'package:ionic/features/orders/data/models/orders_model.dart';
import 'package:ionic/features/orders/domain/entity/orders_product_entity.dart';

import '../../../../core/utils/enums/delivery_instructions_enum.dart';
import '../../../../core/utils/enums/payment_method_enum.dart';

class OrdersEntity {
  final String orderId;
  // for future use (Admin can see all orders of any user)
  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;
  final List<OrdersProductEntity> products;
  final double totalPrice;
  final int totalQuantity;
  final PaymentMethodEnum paymentMethod;
  final DeliveryInstructionsEnum deliveryInstructions;
  final OrderStatusEnum orderStatus;
  final DateTime createdAt;
  final DateTime arrivedAt;

  OrdersEntity({
    required this.orderId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.products,
    required this.totalPrice,
    required this.totalQuantity,
    required this.paymentMethod,
    required this.deliveryInstructions,
    required this.orderStatus,
    required this.createdAt,
    required this.arrivedAt,
  });

  OrdersModel toModel() => OrdersModel(
    orderId: orderId,
    userId: userId,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    address: address,
    products: products.map((e) => e.toModel()).toList(),
    totalPrice: totalPrice,
    totalQuantity: totalQuantity,
    paymentMethod: paymentMethod,
    deliveryInstructions: deliveryInstructions,
    orderStatus: orderStatus,
    createdAt: createdAt,
    arrivedAt: arrivedAt,
  );

  static OrdersEntity loading() => OrdersEntity(
    orderId: '123456789ABCDEFG',
    userId: '',
    firstName: 'Loading',
    lastName: 'Loading',
    phoneNumber: '012301023012303',
    address: 'Loading Loading Loading Loading',
    products: [OrdersProductEntity.loading()],
    totalPrice: 0,
    totalQuantity: 0,
    paymentMethod: PaymentMethodEnum.cod,
    deliveryInstructions: DeliveryInstructionsEnum.callOnArrival,
    orderStatus: OrderStatusEnum.pending,
    createdAt: DateTime.now(),
    arrivedAt: DateTime.now(),
  );

  // copyWith
  OrdersEntity copyWith({
    String? orderId,
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? address,
    List<OrdersProductEntity>? products,
    double? totalPrice,
    int? totalQuantity,
    PaymentMethodEnum? paymentMethod,
    DeliveryInstructionsEnum? deliveryInstructions,
    OrderStatusEnum? orderStatus,
    DateTime? createdAt,
    DateTime? arrivedAt,
  }) {
    return OrdersEntity(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      products: products ?? this.products,
      totalPrice: totalPrice ?? this.totalPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      orderStatus: orderStatus ?? this.orderStatus,
      createdAt: createdAt ?? this.createdAt,
      arrivedAt: arrivedAt ?? this.arrivedAt,
    );
  }
}
