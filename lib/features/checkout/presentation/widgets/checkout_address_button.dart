import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_custom_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/routing/app_router_name.dart';

class CheckoutAddressButton extends StatelessWidget {
  const CheckoutAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CheckoutCustomBox(
      title: context.tr(LocaleKeys.address_address),
      child: BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
        builder: (context, state) {
          final address = context.read<DefaultAddressCubit>().defaultAddress;
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: theme.colorScheme.secondary,
              child: ListTile(
                onTap: () {
                  context.pushNamed(AppRouterName.defaultAddressRoute);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                dense: true,
                leading: const Icon(IconsaxPlusBold.location, size: 24),
                title: Text(
                  context.tr(LocaleKeys.address_deliver_to),
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  address?.address ??
                      context.tr(LocaleKeys.address_no_addresses),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
