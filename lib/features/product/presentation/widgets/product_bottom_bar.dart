import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

import '../../../../core/widgets/drop_down_quantity_button.dart';

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
        child: Row(
          children: [
            const DropDownQuantityButton(),
            const SizedBox(width: 16),
            Expanded(
              child: CustomFilledButton(text: "Add to Cart", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
