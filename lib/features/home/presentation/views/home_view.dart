import 'package:flutter/material.dart';
import 'package:ionic/features/home/presentation/widgets/home_ads.dart';
import 'package:ionic/features/home/presentation/widgets/home_categories_widgets/home_categories.dart';

import '../widgets/home_app_bar_widgets/home_app_bar.dart';
import '../widgets/home_popular_products.dart';
import '../widgets/home_recently_viewed_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        HomeAds(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        HomeCategories(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        HomePopularProducts(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        HomeRecentlyViewedProducts(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }
}
