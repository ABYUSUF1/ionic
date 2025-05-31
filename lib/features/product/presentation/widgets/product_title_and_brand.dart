import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/features/home/data/models/category_model/localized_title.dart';

import '../../../../core/constants/app_font.dart';
import '../../../../core/models/product_model/product.dart';
import '../../../../core/routing/app_router_name.dart';
import '../../../../core/theme/app_colors.dart';

class ProductTitleAndBrand extends StatelessWidget {
  final Product product;
  const ProductTitleAndBrand({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product.brand ?? "Unknown Brand",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap:
                  product.category == null
                      ? null
                      : () {
                        context.push(
                          AppRouterName.categoriesRoute,
                          extra: LocalizedTitle(
                            en: product.category!,
                            ar: product.category!,
                          ),
                        );
                      },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.category != null
                      ? "from ${product.category}"
                      : "Unknown Category",
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          product.title ?? "Unknown Product",
          style: theme.textTheme.bodyLarge!.copyWith(
            fontFamily: appFont(context),
          ),
        ),
      ],
    );
  }
}
