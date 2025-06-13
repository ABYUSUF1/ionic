class CartOrderSummary {
  final double subTotal;
  final double totalPrice;
  final double shippingFee;
  final double couponDiscount;
  final int totalQuantity;

  const CartOrderSummary({
    required this.subTotal,
    required this.totalPrice,
    required this.shippingFee,
    required this.couponDiscount,
    required this.totalQuantity,
  });

  static CartOrderSummary loading() => const CartOrderSummary(
    subTotal: 0,
    totalPrice: 0,
    shippingFee: 0,
    couponDiscount: 0,
    totalQuantity: 0,
  );
}
