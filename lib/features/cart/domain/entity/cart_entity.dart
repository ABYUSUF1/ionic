import 'package:ionic/features/cart/data/models/cart_product.dart';

import '../../data/models/cart_model.dart';

class CartEntity {
  final String cartId;
  final List<CartProduct> cartProducts;

  CartEntity({required this.cartId, required this.cartProducts});

  double get totalPrice {
    double total = 0;
    for (var product in cartProducts) {
      total += product.price * product.quantity;
    }
    return total;
  }

  int get totalQuantity {
    int quantity = 0;
    for (var product in cartProducts) {
      quantity += product.quantity;
    }
    return quantity;
  }

  double get totalDiscountedPrice {
    double total = 0;
    for (var product in cartProducts) {
      total += (product.discount) * product.quantity;
    }
    return total;
  }

  CartEntity copyWith({List<CartProduct>? cartProducts}) {
    return CartEntity(
      cartId: cartId,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  // to model
  CartModel toModel() => CartModel(cartId: cartId, cartProducts: cartProducts);
}
