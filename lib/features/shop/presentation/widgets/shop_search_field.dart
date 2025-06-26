import 'package:flutter/material.dart';

import '../../../../core/widgets/text_field/search_field.dart';

class ShopSearchField extends StatelessWidget {
  const ShopSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: false,
      title: SearchField(
        hintText: 'Search for products...',
        helperText: Text(
          'Search for products, categories, or brands',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
