import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/address_entity.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String fullName,
    required String address,
    required String phoneNumber,
    required AddressEnum type,
    required bool isDefault,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

extension AddressModelExtension on AddressModel {
  AddressEntity toEntity() => AddressEntity(
    id: id,
    fullName: fullName,
    address: address,
    phoneNumber: phoneNumber,
    type: type,
    isDefault: isDefault,
  );
}
