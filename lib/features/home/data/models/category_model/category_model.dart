import 'package:ionic/features/home/domain/entity/category_entity.dart';

import 'localized_title.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.localizedTitle,
    required super.slug,
    required super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      localizedTitle: LocalizedTitle.fromJson(json['localizedTitle']),
      slug: json['slug'],
      imageUrl: json['image_url'],
    );
  }
}
