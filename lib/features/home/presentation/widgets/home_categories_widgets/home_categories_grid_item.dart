import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/home/domain/entity/category_entity.dart';

import '../../../../../core/routing/app_router_name.dart';

class HomeCategoriesGridItem extends StatelessWidget {
  const HomeCategoriesGridItem({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double size = ResponsiveLayout.isMobile(context) ? 60 : 80;
    return InkWell(
      onTap: () {
        context.push(
          AppRouterName.categoriesSlugRoute(category.slug),

          extra: category.localizedTitle,
        );
      },
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(color: theme.colorScheme.secondary),
              child:
                  category.imageUrl.isEmpty
                      ? null
                      : CachedNetworkImage(
                        imageUrl: category.imageUrl,
                        fit: BoxFit.cover,
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
