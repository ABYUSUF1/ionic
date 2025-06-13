// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductItemModelImpl _$$ProductItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProductItemModelImpl(
  productId: json['productId'] as String,
  title: json['title'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  brand: json['brand'] as String,
  rating: (json['rating'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  deliveryDays: (json['deliveryDays'] as num).toInt(),
);

Map<String, dynamic> _$$ProductItemModelImplToJson(
  _$ProductItemModelImpl instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'title': instance.title,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
  'discount': instance.discount,
  'brand': instance.brand,
  'rating': instance.rating,
  'stock': instance.stock,
  'reviewsCount': instance.reviewsCount,
  'deliveryDays': instance.deliveryDays,
};
