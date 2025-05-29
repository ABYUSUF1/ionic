import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/products_grid_view/widgets/products_control_icon_button.dart';

import '../../../constants/app_assets.dart';
import '../../buttons/custom_back_button.dart';
import '../../text_field/search_field.dart';

class ProductsGridAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget helperText;
  final String hintText;
  const ProductsGridAppBar({
    super.key,
    required this.helperText,
    required this.hintText,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Expanded(
                    child: SearchField(
                      helperText: helperText,
                      hintText: hintText,
                    ),
                  ),
                  const ProductsControlIconButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(176);
}
