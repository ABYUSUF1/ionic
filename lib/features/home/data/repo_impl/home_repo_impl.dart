import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/end_points.dart';

import 'package:ionic/core/utils/errors/failure.dart';

import 'package:ionic/features/home/data/models/category_model/category_model.dart';

import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiClient apiClient;
  HomeRepoImpl(this.apiClient);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiClient.get(EndPoints.categories);
      final List<CategoryModel> categories =
          (response.data as List)
              .map((category) => CategoryModel.fromJson(category))
              .toList();

      return Right(categories);
    } catch (e) {
      return Left(Failure("Failed to fetch categories"));
    }
  }
}
