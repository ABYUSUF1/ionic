import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../generated/locale_keys.g.dart';
import 'package:objectbox/objectbox.dart';
import '../models/product_item_model.dart';

@Entity()
class ProductItemEntity {
  @Id()
  int obxId = 0;

  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final double rating;
  final String brand;
  final int stock;
  final int reviewsCount;

  ProductItemEntity({
    this.obxId = 0,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.stock,
    required this.reviewsCount,
    required this.brand,
  });

  static ProductItemEntity loading() {
    return ProductItemEntity(
      id: '-1',
      title: 'Loading',
      imageUrl: '',
      price: 0.0,
      rating: 0.0,
      brand: "Brand",
      stock: 0,
      reviewsCount: 0,
    );
  }
}

extension ProductItemEntityExtension on ProductItemEntity {
  ProductItemModel toProductItemModel() {
    return ProductItemModel(
      id: id,
      title: title,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      stock: stock,
      reviewsCount: reviewsCount,
      brand: brand,
    );
  }

  String formattedReviewsCount(BuildContext context) {
    return context.plural(
      LocaleKeys.product_reviews_count,
      reviewsCount,
      args: [reviewsCount.toString()],
    );
  }

  String formattedStock(BuildContext context) {
    if (stock > 0) {
      return stock > 10
          ? context.tr(LocaleKeys.product_in_stock, args: [stock.toString()])
          : context.tr(LocaleKeys.product_only_stock, args: [stock.toString()]);
    } else {
      return context.tr(LocaleKeys.product_out_of_stock);
    }
  }
}
