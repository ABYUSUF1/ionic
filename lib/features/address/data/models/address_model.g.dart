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
      type: $enumDecode(_$AddressEnumEnumMap, json['type']),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'type': _$AddressEnumEnumMap[instance.type]!,
      'isDefault': instance.isDefault,
    };

const _$AddressEnumEnumMap = {
  AddressEnum.home: 'home',
  AddressEnum.work: 'work',
  AddressEnum.other: 'other',
};
