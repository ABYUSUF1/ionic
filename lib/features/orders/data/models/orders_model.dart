import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/enums/delivery_instructions_enum.dart';
import 'package:ionic/core/utils/enums/order_status_enum.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/features/orders/data/models/orders_product_model.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrdersModel with _$OrdersModel {
  @JsonSerializable(explicitToJson: true)
  const factory OrdersModel({
    required String orderId,
    required String userId,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
    required List<OrdersProductModel> products,
    required double totalPrice,
    required int totalQuantity,
    required PaymentMethodEnum paymentMethod,
    required DeliveryInstructionsEnum deliveryInstructions,
    required OrderStatusEnum orderStatus,
    required DateTime createdAt,
    required DateTime arrivedAt,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}

extension OrdersModelMapper on OrdersModel {
  OrdersEntity toEntity() => OrdersEntity(
    orderId: orderId,
    userId: userId,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    address: address,
    products: products.map((e) => e.toEntity()).toList(),
    totalPrice: totalPrice,
    totalQuantity: totalQuantity,
    paymentMethod: paymentMethod,
    deliveryInstructions: deliveryInstructions,
    orderStatus: orderStatus,
    createdAt: createdAt,
    arrivedAt: arrivedAt,
  );
}
