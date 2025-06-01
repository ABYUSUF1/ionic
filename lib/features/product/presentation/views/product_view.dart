import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/models/product_model/product.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/product/presentation/manager/cubit/product_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../widgets/product_mobile_view.dart';
import '../widgets/product_tablet_view.dart';

class ProductView extends StatelessWidget {
  final String productId;
  final Product? product;
  const ProductView({super.key, this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create:
          (context) => ProductCubit(getIt())..getProduct(productId, product),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final Product product = state.maybeWhen(
            orElse: () => Product.loading(),
            success: (p) => p,
          );
          return Skeletonizer(
            enabled: state.maybeWhen(orElse: () => false, loading: () => true),
            effect: ShimmerEffect(
              baseColor: theme.colorScheme.secondary,
              highlightColor: theme.colorScheme.surface,
            ),
            child: ResponsiveLayout(
              tabletChild: ProductTabletView(product: product),
              mobileChild: ProductMobileView(product: product),
            ),
          );
        },
      ),
    );
  }
}
