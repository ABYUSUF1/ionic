part of 'default_address_cubit.dart';

@freezed
class DefaultAddressState with _$DefaultAddressState {
  const factory DefaultAddressState.initial() = _Initial;
  const factory DefaultAddressState.loading() = _Loading;
  const factory DefaultAddressState.success(List<AddressEntity> addresses) =
      _Success;
  const factory DefaultAddressState.empty() = _Empty;
  const factory DefaultAddressState.error(String errMessage) = _Error;
}
