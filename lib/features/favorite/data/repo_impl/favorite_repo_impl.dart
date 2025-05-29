import 'package:dartz/dartz.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/favorite/data/data_sources/remote/favorite_remote_data_source.dart';

import '../../domain/repo/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteRemoteDataSource _remote;
  FavoriteRepoImpl(this._remote);

  @override
  Future<Either<Failure, void>> addFavorite(
    ProductItemEntity productItemEntity,
  ) async {
    try {
      await _remote.addFavorite(productItemEntity.toProductItemModel());
      return const Right(null);
    } catch (e) {
      print(e.toString());
      return const Left(Failure("Failed to add favorite"));
    }
  }

  @override
  Future<Either<Failure, List<ProductItemEntity>>> fetchFavorites() async {
    try {
      final List<ProductItemEntity> response = await _remote.fetchFavorites();
      return Right(response);
    } catch (e) {
      return const Left(Failure("Failed to fetch favorites"));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String productId) async {
    try {
      await _remote.removeFavorite(productId);
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to remove favorite"));
    }
  }
}
