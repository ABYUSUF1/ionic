import 'package:dartz/dartz.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/utils/errors/failure.dart';

import '../../../../core/models/product_model/products_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, ProductsModel>> search(
    String query,
    int limit,
    int skip,
  );

  List<ProductItemEntity> getRecentSearches();
  void addRecentSearches(ProductItemEntity productItem);
  void deleteRecentSearches(ProductItemEntity productItem);
}
