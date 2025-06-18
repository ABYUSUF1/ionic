import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../../domain/repo/address_repo.dart';
import '../manager/save_address/save_address_cubit.dart';
import '../widgets/save_address_widgets/save_address_form.dart';

class SaveAddressView extends StatelessWidget {
  final AddressEntity addressEntity;
  const SaveAddressView({super.key, required this.addressEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse:
              () => Scaffold(
                body: EmptyStateWidget(
                  svgImage:
                      isDarkMode
                          ? AppAssets.illustrationsLoginIllustrationDark
                          : AppAssets.illustrationsLoginIllustrationLight,
                  title: context.tr(LocaleKeys.address_sign_in_required),
                  subtitle: context.tr(
                    LocaleKeys.address_sign_in_required_desc,
                  ),
                ),
              ),
          authenticated:
              (authEntity) => BlocProvider(
                create:
                    (context) =>
                        SaveAddressCubit(getIt<AddressRepo>())
                          ..init(addressEntity),
                child: const SaveAddressForm(),
              ),
        );
      },
    );
  }
}
