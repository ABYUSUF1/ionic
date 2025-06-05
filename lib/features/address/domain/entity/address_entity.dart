import 'package:ionic/features/address/data/models/address_model.dart';

abstract class AddressEntity {
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
}
