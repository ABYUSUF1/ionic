import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../generated/locale_keys.g.dart';
import '../manager/cubit/orders_cubit.dart';

class OrdersSearchFiled extends StatefulWidget {
  const OrdersSearchFiled({super.key});

  @override
  State<OrdersSearchFiled> createState() => _OrdersSearchFiledState();
}

class _OrdersSearchFiledState extends State<OrdersSearchFiled> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) {
        setState(() {});
        context.read<OrdersCubit>().onSearchChanged(value, context);
      },
      decoration: InputDecoration(
        hintText: context.tr(
          LocaleKeys.common_search_for,
          args: [context.tr(LocaleKeys.orders_title)],
        ),
        hintStyle: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        prefixIcon: const Icon(IconsaxPlusLinear.search_normal_1),
        suffixIcon:
            controller.text.isNotEmpty
                ? IconButton(
                  icon: const Icon(IconsaxPlusLinear.close_circle),
                  color: theme.colorScheme.onSurfaceVariant,
                  onPressed: () {
                    controller.clear();
                    setState(() {});
                    context.read<OrdersCubit>().onSearchChanged('', context);
                  },
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme.colorScheme.secondary,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
