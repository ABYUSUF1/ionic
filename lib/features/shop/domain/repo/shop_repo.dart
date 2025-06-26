import 'package:dartz/dartz.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/utils/errors/failure.dart';

abstract class ShopRepo {
  Future<Either<Failure, ProductsEntity>> getProducts({int? limit, int? skip});
}
