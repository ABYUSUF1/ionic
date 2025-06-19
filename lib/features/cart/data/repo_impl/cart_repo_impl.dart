import 'package:dartz/dartz.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';
import 'package:ionic/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:ionic/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ionic/features/cart/data/mappers/cart_mapper.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/domain/entity/cart_product_entity.dart';

import '../../domain/repo/cart_repo.dart';

class CartRepoImpl with AuthGuardMixin implements CartRepo {
  final CartRemoteDataSource _remote;
  final CartLocalDataSource _local;

  CartRepoImpl(this._remote, this._local);

  @override
  Future<Either<Failure, void>> addToCart(
    CartProductEntity cartProductEntity,
  ) async {
    try {
      if (isEmailVerified) {
        await _remote.addToCart(cartProductEntity.toRemote());
      } else {
        _local.addToCart(cartProductEntity.toLocal());
      }
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to add to cart"));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> fetchCart() async {
    try {
      if (isEmailVerified) {
        final response = await _remote.fetchCart();
        return Right(response.toEntity());
      } else {
        final response = _local.fetchCart();
        return Right(response.toEntity());
      }
    } catch (e) {
      print(e.toString());
      return Left(Failure("Failed to fetch cart ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String productId) async {
    try {
      if (isEmailVerified) {
        await _remote.removeFromCart(productId);
      } else {
        _local.removeFromCart(productId);
      }
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to remove from cart"));
    }
  }

  /// we will use it when user logs out
  @override
  Either<Failure, void> clearCart() {
    try {
      _local.clearCart();
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to clear cart"));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> syncLocalCartToRemote() async {
    try {
      if (!isEmailVerified) {
        // Guest user, return local cart
        final localCart = _local.fetchCart();
        return Right(localCart.toEntity());
      }

      final localCart = _local.fetchCart().cartProducts;
      if (localCart.isEmpty) {
        // Nothing to sync, just return remote cart
        final remoteCart = await _remote.fetchCart();
        return Right(remoteCart.toEntity());
      }

      final remoteCart = (await _remote.fetchCart()).cartProducts;

      // Map existing remote cart products by productId
      final Map<String, CartProductEntity> remoteCartMap = {
        for (var item in remoteCart)
          item.productItem.productId: item.toEntity(),
      };

      for (final localItem in localCart) {
        final productId = localItem.productItem.target?.productId;
        if (productId == null) continue;

        if (remoteCartMap.containsKey(productId)) {
          final remoteItem = remoteCartMap[productId]!;
          final mergedItem = remoteItem.copyWith(
            quantity: remoteItem.quantity + localItem.quantity,
          );
          await _remote.addToCart(mergedItem.toRemote());
          remoteCartMap[productId] = mergedItem;
        } else {
          final newItem = localItem.toEntity();
          await _remote.addToCart(newItem.toRemote());
          remoteCartMap[productId] = newItem;
        }
      }

      // Clear guest cart after sync
      _local.clearCart();

      // Return merged result as one CartEntity
      return Right(
        CartEntity(cartProductsEntity: remoteCartMap.values.toList()),
      );
    } catch (e) {
      print("Error syncing local cart: $e");
      return const Left(Failure("Failed to sync local cart"));
    }
  }
}
