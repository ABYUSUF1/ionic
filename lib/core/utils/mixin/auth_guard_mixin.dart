import 'package:ionic/core/services/auth/firebase_auth_service.dart';
import 'package:ionic/core/services/di/get_it_service.dart';

mixin AuthGuardMixin {
  final user = getIt<FirebaseAuthService>();

  // Check user is signed in or not
  bool get isEmailVerified =>
      user.currentUser != null && user.currentUser!.emailVerified;

  String get userId => user.currentUser?.uid ?? '';
}
