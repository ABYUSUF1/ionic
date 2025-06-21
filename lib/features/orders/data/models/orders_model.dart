import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/models/order_summary_model.dart';
import 'package:ionic/core/utils/enums/delivery_instructions_enum.dart';
import 'package:ionic/core/utils/enums/order_status_enum.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/features/orders/data/models/orders_product_model.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

import 'orders_customer_info_model.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrdersModel with _$OrdersModel {
  @JsonSerializable(explicitToJson: true)
  const factory OrdersModel({
    required String orderId,
    required OrdersCustomerInfoModel customerInfoModel,
    required OrderSummaryModel summaryModel,
    required List<OrdersProductModel> products,
    required PaymentMethodEnum paymentMethod,
    required DeliveryInstructionsEnum deliveryInstructions,
    required OrderStatusEnum orderStatus,
    required DateTime placedAt,
    required DateTime arrivedAt,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}

extension OrdersModelMapper on OrdersModel {
  OrdersEntity toEntity() => OrdersEntity(
    orderId: orderId,
    products: products.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
    customerInfoEntity: customerInfoModel.toEntity(),
    summaryEntity: summaryModel.toEntity(),
    deliveryInstructions: deliveryInstructions,
    orderStatus: orderStatus,
    placedAt: placedAt,
    arrivedAt: arrivedAt,
  );
}
