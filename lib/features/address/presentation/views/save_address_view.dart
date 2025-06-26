import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/widgets/required_login_widget.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../../../../core/services/di/get_it_service.dart';
import '../../domain/repo/address_repo.dart';
import '../manager/save_address/save_address_cubit.dart';
import '../widgets/save_address_widgets/save_address_form.dart';

class SaveAddressView extends StatelessWidget {
  final AddressEntity addressEntity;
  const SaveAddressView({super.key, required this.addressEntity});

  @override
  Widget build(BuildContext context) {
    return RequiredLoginScreen(
      appBarTitle: context.tr(LocaleKeys.address_save_address),
      description: context.tr(LocaleKeys.address_sign_in_required_desc),
      child: BlocProvider(
        create:
            (context) =>
                SaveAddressCubit(getIt<AddressRepo>())..init(addressEntity),
        child: const SaveAddressForm(),
      ),
    );
  }
}
