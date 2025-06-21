import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/utils/enums/address_type_enum.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../manager/locate_on_map/locate_on_map_cubit.dart';

class LocateOnMapConfirmButton extends StatelessWidget {
  const LocateOnMapConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<LocateOnMapCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomFilledButton(
        text: context.tr(LocaleKeys.address_confirm_location),
        textStyle: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color:
              state.isSuccess
                  ? Colors.white
                  : theme.colorScheme.onSurfaceVariant,
        ),
        buttonColor:
            state.isSuccess
                ? AppColors.primaryColor
                : theme.colorScheme.secondary,
        onPressed:
            state.isSuccess
                ? () => context.push(
                  AppRouterName.saveAddressRoute,
                  extra: state.whenOrNull(
                    success: (address, latLng) {
                      final authEntity =
                          context.read<AuthCubit>().cachedAuthEntity;
                      return AddressEntity(
                        id: '',
                        address: address,
                        phoneNumber: authEntity?.phoneNumber ?? '',
                        type: AddressTypeEnum.home,
                        isDefault: false,
                        fullName: authEntity!.displayName,
                        lat: latLng.latitude,
                        lng: latLng.longitude,
                      );
                    },
                  ),
                )
                : null,
      ),
    );
  }
}
