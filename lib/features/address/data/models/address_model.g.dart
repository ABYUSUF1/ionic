// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      type: $enumDecode(_$AddressTypeEnumEnumMap, json['type']),
      isDefault: json['isDefault'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'type': _$AddressTypeEnumEnumMap[instance.type]!,
      'isDefault': instance.isDefault,
      'lat': instance.lat,
      'lng': instance.lng,
    };

const _$AddressTypeEnumEnumMap = {
  AddressTypeEnum.home: 'home',
  AddressTypeEnum.work: 'work',
  AddressTypeEnum.other: 'other',
};
