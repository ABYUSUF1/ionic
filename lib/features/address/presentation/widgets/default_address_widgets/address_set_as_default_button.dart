import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

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
                context.tr(LocaleKeys.address_already_default),
                style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
              : TextButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: context.tr(LocaleKeys.address_set_as_default),
                    subTitle: context.tr(
                      LocaleKeys.address_set_as_default_desc,
                    ),
                    svgPic:
                        isDark
                            ? AppAssets.illustrationsGpsIllustrationDark
                            : AppAssets.illustrationsGpsIllustrationLight,
                    buttonText: context.tr(LocaleKeys.address_set_as_default),
                    onTap: () {
                      context.read<DefaultAddressCubit>().setDefaultAddress(
                        addressEntity,
                      );
                      context.pop();
                    },
                  );
                },
                child: Text(context.tr(LocaleKeys.address_set_as_default)),
              ),
    );
  }
}
