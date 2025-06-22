import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel extends AuthEntity with _$AuthModel {
  const factory AuthModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required bool isEmailVerified,
    required String? phoneNumber,
    required String? photoUrl,
    required String? gender,
    required DateTime? birthDate,
    required String? fcmToken,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
