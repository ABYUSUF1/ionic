import 'package:dartz/dartz.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/utils/errors/failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<ProductItemEntity>>> fetchFavorites();
  Future<Either<Failure, void>> addFavorite(
    ProductItemEntity productItemEntity,
  );
  Future<Either<Failure, void>> removeFavorite(String productId);
}
