// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductItemModelImpl _$$ProductItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProductItemModelImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  brand: json['brand'] as String,
  stock: (json['stock'] as num).toInt(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
);

Map<String, dynamic> _$$ProductItemModelImplToJson(
  _$ProductItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
  'rating': instance.rating,
  'brand': instance.brand,
  'stock': instance.stock,
  'reviewsCount': instance.reviewsCount,
};
