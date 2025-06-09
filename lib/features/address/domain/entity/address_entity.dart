import 'package:ionic/features/address/data/models/address_model.dart';

class AddressEntity {
  final String id;
  final String fullName;
  final String address;
  final String phoneNumber;
  final String type;
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
    type: '',
    isDefault: false,
  );

  static AddressEntity loading() => AddressEntity(
    id: '',
    fullName: 'Loading Loading',
    address: 'Loading address details Loading ...',
    phoneNumber: 'Loading',
    type: 'Loading',
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
    String? type,
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
