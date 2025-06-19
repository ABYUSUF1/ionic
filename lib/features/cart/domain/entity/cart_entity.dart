import 'cart_product_entity.dart';

class CartEntity {
  final List<CartProductEntity> cartProductsEntity;

  const CartEntity({required this.cartProductsEntity});

  // Loading
  factory CartEntity.loading() => const CartEntity(cartProductsEntity: []);
}
