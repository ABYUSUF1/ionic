import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/models/product_item_model.dart';
import 'package:ionic/core/utils/enums/delivery_instructions_enum.dart';
import 'package:ionic/core/utils/enums/order_status_enum.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrdersModel with _$OrdersModel {
  const factory OrdersModel({
    required String orderId,
    required String userId,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
    required List<ProductItemModel> products,
    required double totalPrice,
    required int totalQuantity,
    required PaymentMethodEnum paymentMethod,
    required DeliveryInstructionsEnum deliveryInstructions,
    required OrderStatusEnum orderStatus,
    required DateTime placedAt,
    required DateTime deliveredAt,
    required bool isPaid,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}
