import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../manager/save_address/save_address_cubit.dart';
import 'save_address_view_body.dart';

class SaveAddressForm extends StatelessWidget {
  const SaveAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SaveAddressCubit>();

    final theme = Theme.of(context);
    return Form(
      key: cubit.formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            cubit.isEdit
                ? context.tr(LocaleKeys.address_update_address)
                : context.tr(LocaleKeys.address_save_address),
            style: theme.textTheme.headlineMedium,
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<SaveAddressCubit, SaveAddressState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading:
                      (loadingMess) =>
                          showFullScreenLoading(context, loadingMess),
                  addSuccess: (address) {
                    closeFullScreenLoading(context);
                    context.read<DefaultAddressCubit>().addAddress(address);

                    // pop 2 times to go back to default address screen
                    context.pop();
                    context.pop();
                  },
                  editSuccess: (address) {
                    closeFullScreenLoading(context);
                    context.read<DefaultAddressCubit>().addAddress(address);

                    // pop 1 times to go back to default address screen
                    context.pop();
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                );
                return CustomFilledButton(
                  text:
                      cubit.isEdit
                          ? context.tr(LocaleKeys.address_update_address)
                          : context.tr(LocaleKeys.address_save_address),
                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            await cubit.saveAddress(context);
                          },
                );
              },
            ),
          ),
        ),
        body: const SaveAddressViewBody(),
      ),
    );
  }
}
