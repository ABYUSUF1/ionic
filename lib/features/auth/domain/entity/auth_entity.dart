import '../../data/models/auth_model.dart';

class AuthEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isEmailVerified;
  final String? phoneNumber;
  final String? photoUrl;
  final String? gender;
  final DateTime? birthDate;
  final String? fcmToken;

  AuthEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.isEmailVerified,
    this.photoUrl,
    this.gender,
    this.birthDate,
    this.fcmToken,
  });
}

extension AuthEntityExtension on AuthEntity {
  // Display name
  String get displayName => '$firstName $lastName';

  // Formatted email (until @gmail.com)
  String get formattedEmail => email.split('@')[0];

  // CopyWith
  AuthEntity copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? isEmailVerified,
    String? photoUrl,
    String? gender,
    DateTime? birthDate,
  }) => AuthEntity(
    id: id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    photoUrl: photoUrl ?? this.photoUrl,
    birthDate: birthDate ?? this.birthDate,
    gender: gender ?? this.gender,
  );

  // to Model
  AuthModel toModel() => AuthModel(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    isEmailVerified: isEmailVerified,
    phoneNumber: phoneNumber,
    photoUrl: photoUrl,
    gender: gender,
    birthDate: birthDate,
    fcmToken: fcmToken,
  );
}
