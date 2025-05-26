import 'package:dartz/dartz.dart';
import 'package:ionic/core/models/product_model/products_model.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/home/data/models/category_model/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, ProductsModel>> fetchPopularProducts();
}
