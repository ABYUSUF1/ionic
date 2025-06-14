import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/utils/enums/order_status_enum.dart';

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
  final List<ProductItemEntity> products;
  final double totalPrice;
  final int totalQuantity;
  final PaymentMethodEnum paymentMethod;
  final DeliveryInstructionsEnum deliveryInstructions;
  final OrderStatusEnum orderStatus;
  final DateTime placedAt;
  final DateTime deliveredAt;
  final bool isPaid;

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
    required this.placedAt,
    required this.deliveredAt,
    required this.isPaid,
  });
}
