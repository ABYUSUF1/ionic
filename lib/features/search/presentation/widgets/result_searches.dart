import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/entities/products_entity.dart';

class ResultSearches extends StatelessWidget {
  final ProductsEntity productsEntity;
  final void Function() onLoadMore;
  final bool isPaginating;

  const ResultSearches({
    super.key,
    required this.productsEntity,
    required this.onLoadMore,
    this.isPaginating = false,
  });

  @override
  Widget build(BuildContext context) {
    final products = productsEntity.products;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FadeInDown(
      from: 20,
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.plural(
              LocaleKeys.search_results_searches,
              productsEntity.total,
              args: [productsEntity.total.toString()],
            ),
          ),
          const SizedBox(height: 30),
          products.isEmpty
              ? Center(
                child: EmptyStateWidget(
                  svgImage:
                      !isDarkMode
                          ? AppAssets.illustrationsNoSearchIllustrationLight
                          : AppAssets.illustrationsNoSearchIllustrationDark,
                  title: context.plural(
                    LocaleKeys.search_results_searches,
                    products.length,
                    args: [products.length.toString()],
                  ),
                  subtitle: '',
                ),
              )
              : Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    // Trigger when user is within 200 pixels of the bottom
                    if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent - 300 &&
                        !isPaginating) {
                      onLoadMore();
                    }
                    return false;
                  },
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: products.length + (isPaginating ? 1 : 0),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == products.length) {
                        // Paginate
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final product = products[index];
                      return ListTile(
                        title: Text(product.title ?? ''),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          context.read<SearchCubit>().addRecentSearch(product);
                          context.push(
                            AppRouterName.productIdRoute(
                              product.id!.toString(),
                            ),
                            extra: product,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
