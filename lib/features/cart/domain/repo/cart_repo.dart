import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart(CartEntity cartEntity);
  Future<Either<Failure, List<CartEntity>>> fetchCart();
  Future<Either<Failure, void>> removeFromCart(String productId);
}
