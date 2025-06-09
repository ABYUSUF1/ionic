import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/functions/generate_random_id.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';

part 'save_address_state.dart';
part 'save_address_cubit.freezed.dart';

class SaveAddressCubit extends Cubit<SaveAddressState> {
  final AddressRepo _repo;

  SaveAddressCubit(this._repo)
    : super(SaveAddressState.initial(AddressEntity.empty()));

  AddressEntity addressEntity = AddressEntity.empty();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedAddress = "";
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String selectedAddressType = "Home";
  bool isDefault = false;

  void init(AddressEntity selectedAddressEntity) {
    selectedAddress = selectedAddressEntity.address;
    firstNameController.text = selectedAddressEntity.firstName;
    lastNameController.text = selectedAddressEntity.lastName;
    phoneNumberController.text = selectedAddressEntity.phoneNumber;
    addressEntity = selectedAddressEntity;
    isDefault = selectedAddressEntity.isDefault;
    emit(SaveAddressState.initial(selectedAddressEntity));
  }

  void onDefaultChanged(bool value) {
    isDefault = value;
    addressEntity = addressEntity.copyWith(isDefault: value);
    emit(SaveAddressState.initial(addressEntity));
  }

  void onAddressTypeChanged(String addressType) {
    selectedAddressType = addressType;
    addressEntity = addressEntity.copyWith(type: addressType);
    emit(SaveAddressState.initial(addressEntity));
  }

  bool resolveIsDefault(BuildContext context) {
    final addresses = context.read<DefaultAddressCubit>().addresses;
    final isEdit = addressEntity.id.isNotEmpty;
    final isFirstAddress = addresses.isEmpty;
    final isOnlyAddress = addresses.length == 1;

    if (isFirstAddress) return true;
    if (isOnlyAddress && isEdit) return true;
    return isDefault;
  }

  Future<void> saveAddress(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final isEdit = addressEntity.id.isNotEmpty;

      addressEntity = addressEntity.copyWith(
        /// Address Id if exist that mean we edit address
        /// else we create new address
        id: isEdit ? addressEntity.id : generateRandomId(),
        fullName: "${firstNameController.text} ${lastNameController.text}",
        phoneNumber: phoneNumberController.text,
        type: selectedAddressType,
        address: selectedAddress,
        isDefault: resolveIsDefault(context),
      );
      if (isEdit) {
        emit(const SaveAddressState.loading("Updating Address..."));
      } else {
        emit(const SaveAddressState.loading("Saving..."));
      }
      final result = await _repo.addUserAddress(addressEntity);
      result.fold((l) => emit(SaveAddressState.error(l.errMessage)), (r) {
        if (isEdit) {
          emit(SaveAddressState.editSuccess(addressEntity));
        } else {
          emit(SaveAddressState.addSuccess(addressEntity));
        }
        context.read<DefaultAddressCubit>().setDefaultAddress(addressEntity);
      });
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
