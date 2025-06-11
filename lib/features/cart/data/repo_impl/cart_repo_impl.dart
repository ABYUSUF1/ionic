import 'package:dartz/dartz.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ionic/features/cart/data/models/cart_model.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';

import '../../domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _remote;

  CartRepoImpl(this._remote);

  @override
  Future<Either<Failure, void>> addToCart(CartEntity cartEntity) async {
    try {
      await _remote.addToCart(cartEntity.toModel());
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to add to cart"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> fetchCart() async {
    try {
      final result = await _remote.fetchCart();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(Failure("Failed to fetch cart"));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String productId) async {
    try {
      await _remote.removeFromCart(productId);
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to remove from cart"));
    }
  }
}
