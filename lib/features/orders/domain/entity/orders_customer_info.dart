import 'package:ionic/core/utils/enums/address_type_enum.dart';

import '../../data/models/orders_customer_info_model.dart';

class OrdersCustomerInfoEntity {
  final String userId;
  final String fullName;
  final String phoneNumber;
  final String address;
  final AddressTypeEnum addressType; // Home, Work, ..
  final double lat;
  final double lng;

  OrdersCustomerInfoEntity({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.addressType,
    required this.lat,
    required this.lng,
  });

  // to model
  OrdersCustomerInfoModel toModel() => OrdersCustomerInfoModel(
    userId: userId,
    fullName: fullName,
    phoneNumber: phoneNumber,
    address: address,
    addressType: addressType,
    lat: lat,
    lng: lng,
  );

  // Loading
  static OrdersCustomerInfoEntity loading() => OrdersCustomerInfoEntity(
    userId: '',
    fullName: 'Loading Loading',
    phoneNumber: '12345678912',
    address: 'Loading Loading Loading Loading',
    addressType: AddressTypeEnum.home,
    lat: 0,
    lng: 0,
  );
}
