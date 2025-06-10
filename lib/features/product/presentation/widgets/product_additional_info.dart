import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/models/product_model/product.dart';
import '../../../../core/utils/functions/product_formatted.dart';

class ProductAdditionalInfo extends StatelessWidget {
  final Product product;
  const ProductAdditionalInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomListTile(
          leadingIcon: Icons.verified_user_outlined,
          title: formattedWarranty(context, product.warrantyInformation),
        ),
        _CustomListTile(
          leadingIcon: IconsaxPlusLinear.truck_time,
          title: formattedShipping(context, product.shippingInformation),
        ),
        _CustomListTile(
          leadingIcon: Icons.confirmation_number_outlined,
          title: product.sku.toString(),
        ),
        _CustomListTile(
          leadingIcon: IconsaxPlusLinear.undo,
          title: formattedReturnPolicy(context, product.returnPolicy),
        ),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  const _CustomListTile({required this.leadingIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(leadingIcon),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
