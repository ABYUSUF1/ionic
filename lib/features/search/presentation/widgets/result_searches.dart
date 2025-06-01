import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';

import '../../../../core/entities/products_entity.dart';

class ResultSearches extends StatefulWidget {
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
  State<ResultSearches> createState() => _ResultSearchesState();
}

class _ResultSearchesState extends State<ResultSearches> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController()..addListener(() {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300) {
            widget.onLoadMore();
          }
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.productsEntity.products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${widget.productsEntity.total} Result Searches"),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            itemCount: products.length + (widget.isPaginating ? 1 : 0),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              if (index == products.length) {
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
                    AppRouterName.productIdRoute(product.id!.toString()),
                    extra: product,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
