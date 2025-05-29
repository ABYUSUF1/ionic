import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

part 'product_item_model.freezed.dart';
part 'product_item_model.g.dart';

@freezed
class ProductItemModel extends ProductItemEntity with _$ProductItemModel {
  factory ProductItemModel({
    required String id,
    required String title,
    required String imageUrl,
    required double price,
    required double rating,
    required int stock,
    required int reviewsCount,
  }) = _ProductItemModel;

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProductItemModelFromJson(json);
}
