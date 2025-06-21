import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/enums/address_type_enum.dart';
import 'package:ionic/core/utils/functions/generate_random_id.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

part 'save_address_state.dart';
part 'save_address_cubit.freezed.dart';

class SaveAddressCubit extends Cubit<SaveAddressState> {
  final AddressRepo _repo;

  SaveAddressCubit(this._repo)
    : super(SaveAddressState.initial(AddressEntity.empty()));

  AddressEntity initialAddress = AddressEntity.empty();
  AddressEntity addressEntity = AddressEntity.empty();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  AddressTypeEnum selectedAddressType = AddressTypeEnum.home;
  bool isDefault = false;
  double lat = 0, lng = 0;

  // If we pass id of address that mean we edit address in init
  late bool isEdit;

  void init(AddressEntity selectedAddressEntity) {
    isEdit = selectedAddressEntity.id.isNotEmpty;

    addressController.text = selectedAddressEntity.address;
    firstNameController.text = selectedAddressEntity.firstName;
    lastNameController.text = selectedAddressEntity.lastName;
    phoneNumberController.text = selectedAddressEntity.phoneNumber;
    selectedAddressType = selectedAddressEntity.type;
    addressEntity = selectedAddressEntity;
    isDefault = selectedAddressEntity.isDefault;
    lat = selectedAddressEntity.lat;
    lng = selectedAddressEntity.lng;

    initialAddress = selectedAddressEntity;
    emit(SaveAddressState.initial(selectedAddressEntity));
  }

  void onDefaultChanged(bool value) {
    isDefault = value;
    addressEntity = addressEntity.copyWith(isDefault: value);
    emit(SaveAddressState.initial(addressEntity));
  }

  void onAddressTypeChanged(AddressTypeEnum addressType) {
    selectedAddressType = addressType;
    addressEntity = addressEntity.copyWith(type: addressType);
    emit(SaveAddressState.initial(addressEntity));
  }

  bool resolveIsDefault(BuildContext context) {
    final addresses = context.read<DefaultAddressCubit>().addresses;
    final isFirstAddress = addresses.isEmpty;
    final isOnlyAddress = addresses.length == 1;

    if (isFirstAddress) return true;
    if (isOnlyAddress && isEdit) return true;
    return isDefault;
  }

  Future<void> saveAddress(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      addressEntity = addressEntity.copyWith(
        /// Address Id if exist that mean we edit address
        /// else we create new address
        id: isEdit ? addressEntity.id : generateRandomId(),
        fullName: "${firstNameController.text} ${lastNameController.text}",
        phoneNumber: phoneNumberController.text,
        type: selectedAddressType,
        address: addressController.text,
        isDefault: resolveIsDefault(context),
      );

      // Check first if something changed or not when editing
      if (isEdit && initialAddress == addressEntity) {
        AppSnackbar.showNoteSnackBar(
          context,
          context.tr(LocaleKeys.address_theres_nothing_to_update),
        );
        return;
      }

      if (isEdit) {
        emit(
          SaveAddressState.loading(
            context.tr(LocaleKeys.address_updating_address),
          ),
        );
      } else {
        emit(
          SaveAddressState.loading(
            context.tr(LocaleKeys.address_saving_address),
          ),
        );
      }
      final result = await _repo.addUserAddress(addressEntity);
      result.fold((l) => emit(SaveAddressState.error(l.errMessage)), (r) {
        if (isEdit) {
          emit(SaveAddressState.editSuccess(addressEntity));
        } else {
          emit(SaveAddressState.addSuccess(addressEntity));
        }
        if (isDefault) {
          context.read<DefaultAddressCubit>().setDefaultAddress(addressEntity);
        }
      });
    }
  }

  @override
  Future<void> close() {
    addressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
