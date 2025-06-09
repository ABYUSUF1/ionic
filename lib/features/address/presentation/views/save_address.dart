import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../../../../core/widgets/empty_widget.dart';
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
                body: EmptyWidget(
                  svgImage:
                      isDarkMode
                          ? AppAssets.illustrationsLoginIllustrationDark
                          : AppAssets.illustrationsLoginIllustrationLight,
                  title: "Sign in required",
                  subtitle: "Sign in to save address and place an order",
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
