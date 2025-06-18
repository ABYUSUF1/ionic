import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/address/presentation/widgets/default_address_widgets/default_address_bottom_bar.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../core/constants/app_assets.dart';
import '../manager/default_address/default_address_cubit.dart';
import '../widgets/default_address_widgets/default_address_view_body.dart';

class DefaultAddressView extends StatelessWidget {
  const DefaultAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (authEntity) {
            context.read<DefaultAddressCubit>().fetchAddresses();
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  context.tr(LocaleKeys.address_default_address),
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              bottomNavigationBar: const DefaultAddressBottomBar(),
              body: const DefaultAddressViewBody(),
            );
          },
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
        );
      },
    );
  }
}
