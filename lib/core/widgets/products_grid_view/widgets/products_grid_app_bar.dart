import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_control_icon_button.dart';

import '../../../constants/app_assets.dart';
import '../../buttons/custom_back_button.dart';
import '../../text_field/search_field.dart';
import '../manager/cubit/products_control_cubit.dart';

class ProductsGridAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget helperText;
  final String hintText;
  final bool showSearchField;
  const ProductsGridAppBar({
    super.key,
    required this.helperText,
    required this.hintText,
    required this.showSearchField,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const CustomBackButton(),
                  Center(
                    child: Image.asset(AppAssets.logoIonicLogo, height: 40),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              showSearchField
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Expanded(
                        child: SearchField(
                          helperText: helperText,
                          hintText: hintText,
                          onChanged: (value) {
                            context.read<ProductsControlCubit>().searchProducts(
                              value,
                            );
                          },
                        ),
                      ),
                      const ProductsControlIconButton(),
                    ],
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(176);
}
