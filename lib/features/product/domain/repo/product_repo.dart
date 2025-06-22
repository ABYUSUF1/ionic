import 'package:dartz/dartz.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_model/product.dart';

import '../../../../core/utils/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, Product>> getProduct(String productId);
  Future<Either<Failure, void>> addToRecentlyProducts(
    ProductItemEntity productItem,
  );
}
