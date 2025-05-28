import 'package:dartz/dartz.dart';
import 'package:ionic/core/models/product_model/products_model.dart';
import 'package:ionic/core/utils/errors/failure.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, ProductsModel>> getCategories({
    required String categoryName,
  });
}
