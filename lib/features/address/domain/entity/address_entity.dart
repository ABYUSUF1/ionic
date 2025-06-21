import 'package:ionic/core/utils/enums/address_type_enum.dart';
import 'package:ionic/features/address/data/models/address_model.dart';
import 'package:ionic/features/orders/domain/entity/orders_customer_info.dart';

class AddressEntity {
  final String id;
  final String fullName;
  final String address;
  final String phoneNumber;
  final AddressTypeEnum type;
  final double lat;
  final double lng;
  final bool isDefault;

  AddressEntity({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.type,
    required this.isDefault,
    required this.fullName,
    required this.lat,
    required this.lng,
  });

  static AddressEntity empty() => AddressEntity(
    id: '',
    fullName: '',
    address: '',
    phoneNumber: '',
    type: AddressTypeEnum.home,
    isDefault: false,
    lat: 0,
    lng: 0,
  );

  static AddressEntity loading() => AddressEntity(
    id: '',
    fullName: 'Loading Loading',
    address: 'Loading address details Loading ...',
    phoneNumber: 'Loading',
    type: AddressTypeEnum.home,
    isDefault: false,
    lat: 0,
    lng: 0,
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
    lat: lat,
    lng: lng,
  );

  AddressEntity copyWith({
    String? id,
    String? fullName,
    String? address,
    String? phoneNumber,
    AddressTypeEnum? type,
    bool? isDefault,
    double? lat,
    double? lng,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  String get firstName => fullName.split(' ')[0];
  String get lastName => fullName.split(' ')[1];

  // to OrdersCustomerEntity
  OrdersCustomerInfoEntity toOrdersCustomerInfoEntity(String userId) =>
      OrdersCustomerInfoEntity(
        userId: userId,
        fullName: fullName,
        address: address,
        phoneNumber: phoneNumber,
        addressType: type,
        lat: lat,
        lng: lng,
      );
}
