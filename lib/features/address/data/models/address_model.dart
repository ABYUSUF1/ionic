import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel implements AddressEntity {
  const factory AddressModel({
    required String id,
    required String fullName,
    required String address,
    required String phoneNumber,
    required String type,
    required bool isDefault,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
