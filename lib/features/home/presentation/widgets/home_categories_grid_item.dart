import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';
import 'package:ionic/features/home/domain/entity/category_entity.dart';

class HomeCategoriesGridItem extends StatelessWidget {
  const HomeCategoriesGridItem({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(category.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              isArabic(context)
                  ? category.localizedTitle.ar
                  : category.localizedTitle.en,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
