import 'package:dartz/dartz.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_item_model.dart';
import 'package:ionic/core/models/product_model/products_model.dart';
import 'package:ionic/core/services/data_source/local/object_box_service.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/search/domain/repo/search_repo.dart';

import '../../../../core/api/end_points.dart';
import '../../../../objectbox.g.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiClient _apiClient;
  final ObjectBoxService _objectBoxService;

  SearchRepoImpl(this._apiClient, this._objectBoxService);

  @override
  Future<Either<Failure, ProductsModel>> search(
    String query,
    int limit,
    int skip,
  ) async {
    try {
      final response = await _apiClient.get(
        EndPoints.searchProducts(query, limit, skip),
      );
      return Right(ProductsModel.fromJson(response.data));
    } catch (e) {
      return const Left(Failure("Failed to fetch products"));
    }
  }

  @override
  void addRecentSearches(ProductItemEntity productItem) {
    final box = _objectBoxService.box<ProductItemModel>();

    // Find existing by product.id (not obxId)
    final existing =
        box
            .query(ProductItemModel_.productId.equals(productItem.productId))
            .build()
            .findFirst();

    if (existing != null) {
      box.remove(existing.obxId);
    }

    box.put(productItem.toProductItemModel());
  }

  @override
  void deleteRecentSearches(ProductItemEntity productItem) {
    _objectBoxService.box<ProductItemModel>().remove(
      productItem.toProductItemModel().obxId,
    );
  }

  @override
  List<ProductItemEntity> getRecentSearches() {
    final result = _objectBoxService.box<ProductItemModel>().getAll();
    return result.map((e) => e.toEntity()).toList();
  }
}
