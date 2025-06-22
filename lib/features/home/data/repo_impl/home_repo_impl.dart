import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/end_points.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_item_model.dart';
import 'package:ionic/core/models/product_model/products_model.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';

import 'package:ionic/features/home/data/models/category_model/category_model.dart';

import '../../domain/repo/home_repo.dart';

class HomeRepoImpl with AuthGuardMixin implements HomeRepo {
  final ApiClient apiClient;
  HomeRepoImpl(this.apiClient);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
      return const Left(Failure("Failed to fetch categories"));
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> fetchPopularProducts() async {
    try {
      final response = await apiClient.get(EndPoints.popularProducts);

      final productModel = ProductsModel.fromJson(response.data);

      return Right(productModel);
    } catch (e) {
      return const Left(Failure("Failed to fetch popular products"));
    }
  }

  @override
  Future<Either<Failure, List<ProductItemEntity>>>
  fetchRecentlyProducts() async {
    try {
      final snapshot =
          await firestore
              .collection(FirestoreCollectionNames.users)
              .doc(userId)
              .collection(FirestoreCollectionNames.recentlyProducts)
              .get();

      final products =
          snapshot.docs
              .map((doc) => (ProductItemModel.fromJson(doc.data())).toEntity())
              .toList();

      return Right(products);
    } catch (e) {
      return const Left(Failure("Failed to fetch recently products"));
    }
  }
}
