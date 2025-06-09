import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/empty_widget.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import 'default_addresses_list.dart';

class DefaultAddressViewBody extends StatelessWidget {
  const DefaultAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
      builder: (context, state) {
        return state.maybeWhen(
          empty:
              () => EmptyWidget(
                svgImage:
                    isDark
                        ? AppAssets.illustrationsGpsIllustrationDark
                        : AppAssets.illustrationsGpsIllustrationLight,
                title: context.tr(LocaleKeys.address_no_addresses),
                subtitle: context.tr(LocaleKeys.address_no_addresses_desc),
              ),
          error:
              (errMessage) => EmptyWidget(
                svgImage:
                    isDark
                        ? AppAssets.illustrationsErrorIllustrationDark
                        : AppAssets.illustrationsErrorIllustrationLight,
                title: context.tr(LocaleKeys.common_something_went_wrong),
                subtitle: errMessage,
              ),
          orElse: () {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );

            final List<AddressEntity> addresses = state.maybeWhen(
              orElse: () => [AddressEntity.loading()],
              success: (addresses) => addresses,
            );

            return DefaultAddressesList(
              isLoading: isLoading,
              addresses: addresses,
            );
          },
        );
      },
    );
  }
}
