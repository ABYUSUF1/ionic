import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import '../widgets/product_bottom_bar.dart';
import '../widgets/product_mobile_view.dart';
import '../widgets/product_tablet_view.dart';

class ProductView extends StatelessWidget {
  final String productId;
  final Product? product;
  const ProductView({super.key, this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ResponsiveLayout(
      tabletChild: ProductTabletView(product: product),
      mobileChild: ProductMobileView(product: product),
    );
  }
}
