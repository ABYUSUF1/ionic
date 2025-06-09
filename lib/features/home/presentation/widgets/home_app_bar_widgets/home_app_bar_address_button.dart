import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../address/presentation/manager/default_address/default_address_cubit.dart';

class HomeAppBarAddressButton extends StatelessWidget {
  const HomeAppBarAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        context.push(AppRouterName.defaultAddressRoute);
      },
      leading: Icon(
        IconsaxPlusLinear.location,
        size: 24,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      title: BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
        builder: (context, state) {
          return Text(
            context.read<DefaultAddressCubit>().defaultAddress?.address ??
                "No address",
            style: theme.textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
      trailing: Icon(
        IconsaxPlusLinear.arrow_down,
        size: 24,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
