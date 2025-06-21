import 'package:ionic/core/models/order_summary_model.dart';

import '../../../../core/utils/functions/product_formatted.dart';
import '../../features/cart/domain/entity/cart_entity.dart';

class OrderSummaryEntity {
  final int totalQuantity;
  final double subtotal;
  final double totalFees;
  final double totalDiscountedPrice;
  final double totalPrice;

  const OrderSummaryEntity({
    required this.totalQuantity,
    required this.subtotal,
    required this.totalFees,
    required this.totalDiscountedPrice,
    required this.totalPrice,
  });

  factory OrderSummaryEntity.fromCart({
    required CartEntity cart,
    required double couponDiscount,
  }) {
    final subtotal = (cart.cartProductsEntity.fold(
      0.0,
      (sum, e) => sum + e.productItem.price * e.quantity,
    )).toStringAsFixed(2);

    final hasShipping = cart.cartProductsEntity.any(
      (e) => !isFreeDelivery(e.productItem.price),
    );

    final shippingFee = hasShipping ? 25.0 : 0.0;
    final totalPrice = (double.parse(subtotal) + shippingFee - couponDiscount)
        .toStringAsFixed(2);

    return OrderSummaryEntity(
      totalQuantity: cart.cartProductsEntity.fold(
        0,
        (sum, e) => sum + e.quantity,
      ),
      subtotal: double.parse(subtotal),
      totalFees: shippingFee,
      totalDiscountedPrice: couponDiscount,
      totalPrice: double.parse(totalPrice),
    );
  }

  static OrderSummaryEntity loading() => const OrderSummaryEntity(
    totalQuantity: 0,
    subtotal: 0.0,
    totalFees: 0.0,
    totalDiscountedPrice: 0.0,
    totalPrice: 0.0,
  );

  /// to Model
  OrderSummaryModel toModel() => OrderSummaryModel(
    totalQuantity: totalQuantity,
    subtotal: subtotal,
    totalFees: totalFees,
    totalPrice: totalPrice,
    totalDiscountedPrice: totalDiscountedPrice,
  );
}
