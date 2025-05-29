import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';


part 'product_item_model.freezed.dart';
part 'product_item_model.g.dart';

@freezed
class ProductItemModel extends ProductItemEntity with _$ProductItemModel {
  ProductItemModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.price,
    required super.rating,
    required super.stock,
    required super.reviewsCount,
  }) = _ProductItemModel;

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProductItemModelFromJson(json);
}
