import '../../data/models/category_model/localized_title.dart';

class CategoryEntity {
  final int id;
  final LocalizedTitle localizedTitle;
  final String slug;
  final String imageUrl;

  CategoryEntity({
    required this.id,
    required this.localizedTitle,
    required this.slug,
    required this.imageUrl,
  });

  // loading constructor
  CategoryEntity.loading()
    : id = 0,
      localizedTitle = LocalizedTitle(en: "Loading", ar: "جار التحميل"),
      slug = "Loading",
      imageUrl = "";
}
