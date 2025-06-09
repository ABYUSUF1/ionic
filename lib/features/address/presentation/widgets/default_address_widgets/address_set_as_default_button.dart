import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';

import '../../../../../core/constants/app_assets.dart';

class AddressSetAsDefaultButton extends StatelessWidget {
  final AddressEntity addressEntity;
  const AddressSetAsDefaultButton({super.key, required this.addressEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding:
          addressEntity.isDefault
              ? const EdgeInsets.only(bottom: 16, top: 8)
              : const EdgeInsets.only(bottom: 8.0),
      child:
          addressEntity.isDefault
              ? Text(
                "Already Default",
                style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
              : TextButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: "Set as default",
                    subTitle:
                        "Are you sure you want to set this address as default?",
                    svgPic:
                        isDark
                            ? AppAssets.illustrationsGpsIllustrationDark
                            : AppAssets.illustrationsGpsIllustrationLight,
                    buttonText: "Set as default",
                    onTap: () {
                      context.read<DefaultAddressCubit>().setDefaultAddress(
                        addressEntity,
                      );
                      context.pop();
                    },
                  );
                },
                child: const Text("Set as default"),
              ),
    );
  }
}
