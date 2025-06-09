import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';

import '../../../../../core/theme/app_colors.dart';

class AddressUpper extends StatelessWidget {
  final AddressEntity addressEntity;
  const AddressUpper({super.key, required this.addressEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: Row(
        children: [
          const Icon(IconsaxPlusLinear.location, size: 18),
          const SizedBox(width: 4),
          Text(
            addressEntity.type,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 8),
          addressEntity.isDefault
              ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Default",
                  style: theme.textTheme.labelSmall!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              )
              : const SizedBox.shrink(),
          const Spacer(),
          TextButton.icon(
            label: const Text("Edit"),
            icon: const Icon(IconsaxPlusLinear.edit_2),
            onPressed: () {
              context.push(
                AppRouterName.saveAddressRoute,
                extra: addressEntity,
              );
            },
          ),
          TextButton.icon(
            label: const Text("Delete"),
            icon: const Icon(IconsaxPlusLinear.trash),
            onPressed: () {
              //TODO: delete address svg
              showCustomDialog(
                context: context,
                title: "Delete Address",
                subTitle: "Are you sure you want to delete this address?",
                svgPic: AppAssets.illustrationsErrorIllustrationDark,
                buttonText: "Delete",
                onTap: () async {
                  context.pop();
                  await context.read<DefaultAddressCubit>().deleteAddress(
                    addressEntity.id,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
