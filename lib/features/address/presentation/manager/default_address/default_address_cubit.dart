import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';

part 'default_address_state.dart';
part 'default_address_cubit.freezed.dart';

class DefaultAddressCubit extends Cubit<DefaultAddressState> {
  final AddressRepo _repo;
  DefaultAddressCubit(this._repo) : super(const DefaultAddressState.initial());

  List<AddressEntity> addresses = <AddressEntity>[];
  AddressEntity? defaultAddress;

  Future<void> fetchAddresses() async {
    if (addresses.isNotEmpty) {
      emit(DefaultAddressState.success(addresses));
      return;
    }

    emit(const DefaultAddressState.loading());
    final result = await _repo.fetchAddresses();
    result.fold((l) => emit(DefaultAddressState.error(l.errMessage)), (r) {
      if (r.isEmpty) {
        emit(const DefaultAddressState.empty());
      } else {
        addresses = r;
        defaultAddress = r.firstWhere((element) => element.isDefault);
        emit(DefaultAddressState.success(addresses));
      }
    });
  }

  Future<void> deleteAddress(String addressId) async {
    emit(const DefaultAddressState.loading());

    final result = await _repo.deleteAddress(addressId);
    result.fold((l) => emit(DefaultAddressState.error(l.errMessage)), (r) {
      addresses.removeWhere((e) => e.id == addressId);

      if (addresses.isEmpty) {
        emit(const DefaultAddressState.empty());
      } else {
        // Reassign default
        final updated =
            addresses.map((e) {
              return e.copyWith(isDefault: e.id == addresses.first.id);
            }).toList();

        addresses = updated;
        defaultAddress = updated.firstWhere((e) => e.isDefault);
        _repo.setDefaultAddress(updated.first);
        emit(DefaultAddressState.success(updated));
      }
    });
  }

  void addAddress(AddressEntity addressEntity) {
    final newList = List<AddressEntity>.from(addresses);
    newList.removeWhere((e) => e.id == addressEntity.id);
    newList.add(addressEntity);

    newList.sort((a, b) {
      if (a.isDefault && !b.isDefault) return -1;
      if (!a.isDefault && b.isDefault) return 1;
      return 0;
    });

    addresses = newList;

    defaultAddress = newList.firstWhere(
      (e) => e.isDefault,
      orElse: () => newList.first,
    );

    emit(DefaultAddressState.success(newList));
  }

  void setDefaultAddress(AddressEntity selectedAddressEntity) {
    final updatedAddresses =
        addresses.map((address) {
          return address.copyWith(
            isDefault: address.id == selectedAddressEntity.id,
          );
        }).toList();

    // make the default address to be the first address in list
    // Sort: default address comes before non-default addresses
    updatedAddresses.sort((a, b) {
      if (a.isDefault && !b.isDefault) {
        return -1; // a comes before b
      } else if (!a.isDefault && b.isDefault) {
        return 1; // b comes before a
      } else {
        return 0; // maintain current order if both are default or both are not default
      }
    });

    addresses = updatedAddresses;
    defaultAddress = selectedAddressEntity;

    _repo.setDefaultAddress(selectedAddressEntity);
    emit(DefaultAddressState.success(updatedAddresses));
  }

  void clearAddresses() {
    addresses = <AddressEntity>[];
    defaultAddress = null;
    emit(const DefaultAddressState.empty());
  }
}
