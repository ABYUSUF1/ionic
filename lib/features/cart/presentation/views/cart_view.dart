import 'package:flutter/material.dart';

import '../widgets/cart_app_bar.dart';
import '../widgets/cart_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CartAppBar(), body: CartList());
  }
}
