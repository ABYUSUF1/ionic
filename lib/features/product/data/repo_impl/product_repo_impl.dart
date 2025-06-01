import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/end_points.dart';

import 'package:ionic/core/models/product_model/product.dart';

import 'package:ionic/core/utils/errors/failure.dart';

import '../../domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiClient _apiClient;

  ProductRepoImpl(this._apiClient);

  @override
  Future<Either<Failure, Product>> getProduct(String productId) async {
    try {
      final response = await _apiClient.get(
        EndPoints.getProductById(productId),
      );
      return Right(Product.fromJson(response.data));
    } catch (e) {
      return const Left(Failure("Failed to fetch product"));
    }
  }
}
