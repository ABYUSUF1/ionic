// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      gender: json['gender'] as String?,
      birthDate:
          json['birthDate'] == null
              ? null
              : DateTime.parse(json['birthDate'] as String),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'fcmToken': instance.fcmToken,
    };
