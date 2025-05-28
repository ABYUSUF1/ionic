import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';

import 'package:ionic/core/models/product_model/products_model.dart';

import 'package:ionic/core/utils/errors/failure.dart';

import '../../../../core/api/end_points.dart';
import '../../domain/repo/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final ApiClient apiClient;

  CategoriesRepoImpl(this.apiClient);

  @override
  Future<Either<Failure, ProductsModel>> getCategories({
    required String categoryName,
  }) async {
    try {
      final response = await apiClient.get(
        EndPoints.categoryProducts(categoryName),
      );
      return Right(ProductsModel.fromJson(response.data));
    } catch (e) {
      return const Left(Failure("Failed to fetch category's products"));
    }
  }
}
