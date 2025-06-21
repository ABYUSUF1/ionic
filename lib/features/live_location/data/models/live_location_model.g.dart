// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveLocationModelImpl _$$LiveLocationModelImplFromJson(
  Map<String, dynamic> json,
) => _$LiveLocationModelImpl(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  userId: json['userId'] as String,
  orderId: json['orderId'] as String,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$LiveLocationModelImplToJson(
  _$LiveLocationModelImpl instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'userId': instance.userId,
  'orderId': instance.orderId,
  'updatedAt': instance.updatedAt.toIso8601String(),
};
