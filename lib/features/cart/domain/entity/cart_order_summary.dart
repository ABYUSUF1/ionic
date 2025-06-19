import '../../../../core/utils/functions/product_formatted.dart';
import 'cart_entity.dart';

class CartOrderSummary {
  final int totalQuantity;
  final double subtotal;
  final double shippingFee;
  final double couponDiscount;
  final double totalPrice;

  const CartOrderSummary({
    required this.totalQuantity,
    required this.subtotal,
    required this.shippingFee,
    required this.couponDiscount,
    required this.totalPrice,
  });

  factory CartOrderSummary.fromCart({
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

    return CartOrderSummary(
      totalQuantity: cart.cartProductsEntity.fold(
        0,
        (sum, e) => sum + e.quantity,
      ),
      subtotal: double.parse(subtotal),
      shippingFee: shippingFee,
      couponDiscount: couponDiscount,
      totalPrice: double.parse(totalPrice),
    );
  }

  static CartOrderSummary loading() => const CartOrderSummary(
    totalQuantity: 0,
    subtotal: 0.0,
    shippingFee: 0.0,
    couponDiscount: 0.0,
    totalPrice: 0.0,
  );
}
