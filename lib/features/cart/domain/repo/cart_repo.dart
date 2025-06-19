import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';

import '../entity/cart_product_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart(CartProductEntity cartProductEntity);
  Future<Either<Failure, CartEntity>> fetchCart();
  Future<Either<Failure, void>> removeFromCart(String productId);
  Either<Failure, void> clearCart();
  Future<Either<Failure, CartEntity>> syncLocalCartToRemote();
}
