import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_control_bottom_sheet.dart';

class ProductsControlIconButton extends StatelessWidget {
  const ProductsControlIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await productsControlBottomSheet(context);
      },
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        minimumSize: const Size(55, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: const Icon(IconsaxPlusLinear.setting),
    );
  }
}
