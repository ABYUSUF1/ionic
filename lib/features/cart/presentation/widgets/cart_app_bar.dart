import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/constants/app_font.dart';
import '../../../home/presentation/widgets/home_app_bar_widgets/home_app_bar_address_button.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      flexibleSpace: Container(
        color: theme.colorScheme.surface,
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                spacing: 8,
                children: [
                  Text(
                    'Cart',
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontFamily: appFont(context),
                    ),
                  ),
                  Text(
                    '(3 Items)',
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontFamily: appFont(context),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconsaxPlusLinear.heart,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const HomeAppBarAddressButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136);
}
