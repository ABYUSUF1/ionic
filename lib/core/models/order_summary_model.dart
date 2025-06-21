import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/order_summary_entity.dart';

part 'order_summary_model.freezed.dart';
part 'order_summary_model.g.dart';

@freezed
class OrderSummaryModel with _$OrderSummaryModel {
  const factory OrderSummaryModel({
    required int totalQuantity,
    required double subtotal,
    required double totalFees,
    required double totalPrice,
    required double totalDiscountedPrice,
  }) = _OrderSummaryModel;

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryModelFromJson(json);
}

extension OrderSummaryModelX on OrderSummaryModel {
  // To entity
  OrderSummaryEntity toEntity() => OrderSummaryEntity(
    subtotal: subtotal,
    totalPrice: totalPrice,
    totalQuantity: totalQuantity,
    totalDiscountedPrice: totalDiscountedPrice,
    totalFees: totalFees,
  );
}
