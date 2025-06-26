import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/features/shop/domain/repo/shop_repo.dart';
import 'package:ionic/features/shop/presentation/manager/cubit/shop_cubit.dart';
import 'package:ionic/features/shop/presentation/widgets/shop_products_grid.dart';
import '../widgets/shop_app_bar.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(getIt<ShopRepo>()),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              ShopAppBar(),
              // ShopSearchField(),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              ShopProductsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
