import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/end_points.dart';

import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/core/models/product_model/products_model.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/errors/server_failure.dart';

import '../../domain/repo/shop_repo.dart';

class ShopRepoImpl implements ShopRepo {
  final ApiClient _apiClient;

  ShopRepoImpl(this._apiClient);

  @override
  Future<Either<Failure, ProductsEntity>> getProducts({
    int? limit,
    int? skip,
  }) async {
    try {
      final response = await _apiClient.get(
        EndPoints.allProducts(limit.toString(), skip.toString()),
      );

      final ProductsModel productModel = ProductsModel.fromJson(response.data);
      return Right(productModel);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
