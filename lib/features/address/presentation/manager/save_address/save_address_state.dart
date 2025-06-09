part of 'save_address_cubit.dart';

@freezed
class SaveAddressState with _$SaveAddressState {
  const factory SaveAddressState.initial(AddressEntity address) = _Initial;
  const factory SaveAddressState.loading(String loadingMessage) = _Loading;
  const factory SaveAddressState.addSuccess(AddressEntity address) =
      _AddSuccess;
  const factory SaveAddressState.editSuccess(AddressEntity address) =
      _EditSuccess;
  const factory SaveAddressState.error(String errMessage) = _Error;
}
