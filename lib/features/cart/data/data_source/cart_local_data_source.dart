import 'package:ionic/features/cart/data/models/cart_local_model.dart';
import 'package:ionic/features/cart/data/models/cart_product_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../../core/services/data_source/local/object_box_service.dart';

class CartLocalDataSource {
  final ObjectBoxService _objectBoxService;

  CartLocalDataSource(this._objectBoxService);

  Box<CartLocalModel> get _cartBox => _objectBoxService.box<CartLocalModel>();
  Box<CartProductLocalModel> get _productBox =>
      _objectBoxService.box<CartProductLocalModel>();

  /// Save cart
  void saveCart(CartLocalModel cart) => _cartBox.put(cart);

  /// Get or create cart
  CartLocalModel fetchCart() {
    final cart = _cartBox.getAll().firstOrNull;
    if (cart != null) return cart;

    final newCart = CartLocalModel();
    _cartBox.put(newCart);
    return newCart;
  }

  /// Add new product to cart (no duplicate check)
  void addToCart(CartProductLocalModel newProduct) {
    final cart = fetchCart();

    newProduct.cart.target = cart;
    _productBox.put(newProduct);
    cart.cartProducts.add(newProduct);
    _cartBox.put(cart);
  }

  /// Remove a product by productId
  void removeFromCart(String productId) {
    final cart = fetchCart();

    final product = cart.cartProducts.firstWhere(
      (p) => p.productItem.target?.productId == productId,
    );

    cart.cartProducts.removeWhere((p) => p.id == product.id);
    _productBox.remove(product.id);
    _cartBox.put(cart);
  }

  /// Clear all cart products
  void clearCart() {
    final cart = fetchCart();

    for (final item in cart.cartProducts) {
      _productBox.remove(item.id);
    }

    cart.cartProducts.clear();
    _cartBox.put(cart);
  }

  /// Get cart products
  List<CartProductLocalModel> getCartProducts() {
    final cart = fetchCart();
    return cart.cartProducts.toList();
  }
}
