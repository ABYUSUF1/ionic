class AuthEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final bool isEmailVerified;

  AuthEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.isEmailVerified,
  });
}
