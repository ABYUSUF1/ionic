// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_customer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersCustomerInfoModelImpl _$$OrdersCustomerInfoModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersCustomerInfoModelImpl(
  userId: json['userId'] as String,
  fullName: json['fullName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  address: json['address'] as String,
  addressType: $enumDecode(_$AddressTypeEnumEnumMap, json['addressType']),
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$$OrdersCustomerInfoModelImplToJson(
  _$OrdersCustomerInfoModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'addressType': _$AddressTypeEnumEnumMap[instance.addressType]!,
  'lat': instance.lat,
  'lng': instance.lng,
};

const _$AddressTypeEnumEnumMap = {
  AddressTypeEnum.home: 'home',
  AddressTypeEnum.work: 'work',
  AddressTypeEnum.other: 'other',
};
