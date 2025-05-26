import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/products_entity.dart';

import 'product.dart';

part 'products_model.freezed.dart';
part 'products_model.g.dart';

@freezed
class ProductsModel extends ProductsEntity with _$ProductsModel {
  factory ProductsModel({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}
