import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../generated/locale_keys.g.dart';

class RecentSearches extends StatelessWidget {
  final List<ProductItemEntity> productsItem;
  const RecentSearches({super.key, required this.productsItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeInDown(
      from: 20,
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productsItem.isEmpty
                ? context.tr(LocaleKeys.search_no_recent_searches)
                : context.tr(LocaleKeys.search_recent_searches),
          ),
          const SizedBox(height: 8),
          Container(
            height: 145,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 80,
              ),
              itemCount: productsItem.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouterName.productIdRoute(
                        productsItem[index].id.toString(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: productsItem[index].imageUrl,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        productsItem[index].title,
                        style: theme.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Divider(endIndent: 60, indent: 60),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
