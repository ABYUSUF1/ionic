import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/end_points.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import 'package:ionic/core/models/product_model/product.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';

import '../../../../core/services/data_source/remote/firestore_collection_names.dart';
import '../../domain/repo/product_repo.dart';

class ProductRepoImpl with AuthGuardMixin implements ProductRepo {
  final ApiClient _apiClient;

  ProductRepoImpl(this._apiClient);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  @override
  Future<Either<Failure, void>> addToRecentlyProducts(
    ProductItemEntity productItem,
  ) async {
    try {
      final recentlyViewedRef = _firestore
          .collection(FirestoreCollectionNames.users)
          .doc(userId)
          .collection(FirestoreCollectionNames.recentlyProducts);

      final docRef = recentlyViewedRef.doc(productItem.productId);

      final now = DateTime.now().toUtc();

      // Check if the product is already in the list
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        // Get current documents to check size
        final snapshot =
            await recentlyViewedRef
                .orderBy('viewedAt', descending: false)
                .get();

        if (snapshot.docs.length >= 10) {
          // Delete the oldest document (first in ascending order)
          await snapshot.docs.first.reference.delete();
        }
      }

      // Add or update the product with a new timestamp
      await docRef.set({
        ...productItem.toProductItemModel().toJson(),
        'viewedAt': now.toIso8601String(),
      });

      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to add to recently products"));
    }
  }
}
