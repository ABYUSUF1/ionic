import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

import 'product_add_to_cart_button.dart';
import 'product_quantity_button.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Padding(
        padding: EdgeInsets.all(
          ResponsiveLayout.isMobile(context) ? 16.0 : 0.0,
        ),
        child: const Row(
          children: [
            ProductQuantityButton(),
            SizedBox(width: 16),
            ProductAddToCartButton(),
          ],
        ),
      ),
    );
  }
}
