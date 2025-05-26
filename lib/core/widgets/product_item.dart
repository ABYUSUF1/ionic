import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../constants/app_assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      width: 150,
      height: 380,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SvgPicture.asset(
              AppAssets.illustrationsLoginIllustrationDark,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Apple Iphone 16 Pro Max 256GB Camera asdda",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: "Pulp Display",
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "4.6 ⭐ (1.2k)",
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text("EGP "),
              Text(
                "77,150",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pulp Display",
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(IconsaxPlusBold.truck_fast, size: 16),
              const SizedBox(width: 3),
              Text(
                "Free Delivery",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
