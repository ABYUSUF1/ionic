import 'package:easy_localization/easy_localization.dart';
import 'package:ionic/features/address/data/models/address_model.dart';

import '../../../../generated/locale_keys.g.dart';

enum AddressEnum { home, work, other }

extension AddressEnumLabel on AddressEnum {
  String get label {
    switch (this) {
      case AddressEnum.home:
        return LocaleKeys.address_type_home.tr();
      case AddressEnum.work:
        return LocaleKeys.address_type_work.tr();
      case AddressEnum.other:
        return LocaleKeys.address_type_other.tr();
    }
  }
}

class AddressEntity {
  final String id;
  final String fullName;
  final String address;
  final String phoneNumber;
  final AddressEnum type;
  final bool isDefault;

  AddressEntity({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.type,
    required this.isDefault,
    required this.fullName,
  });

  static AddressEntity empty() => AddressEntity(
    id: '',
    fullName: '',
    address: '',
    phoneNumber: '',
    type: AddressEnum.home,
    isDefault: false,
  );

  static AddressEntity loading() => AddressEntity(
    id: '',
    fullName: 'Loading Loading',
    address: 'Loading address details Loading ...',
    phoneNumber: 'Loading',
    type: AddressEnum.home,
    isDefault: false,
  );
}

extension AddressEntityExtension on AddressEntity {
  AddressModel toModel() => AddressModel(
    id: id,
    fullName: fullName,
    address: address,
    phoneNumber: phoneNumber,
    type: type,
    isDefault: isDefault,
  );

  AddressEntity copyWith({
    String? id,
    String? fullName,
    String? address,
    String? phoneNumber,
    AddressEnum? type,
    bool? isDefault,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  String get firstName => fullName.split(' ')[0];
  String get lastName => fullName.split(' ')[1];
}
