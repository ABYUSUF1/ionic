import 'package:firebase_auth/firebase_auth.dart';

import 'failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return AuthFailure(
            "The email or password is incorrect or not found. Please try again.");
      case 'email-already-in-use':
        return AuthFailure(
            "That email is already registered. Try logging in or use a different email.");
      case 'invalid-email':
        return AuthFailure("Please enter a valid email address.");
      case 'user-disabled':
        return AuthFailure(
            "This account is currently disabled. Please contact support.");
      case 'user-not-found':
        return AuthFailure(
            "We couldn't find that email. Would you like to create an account?");
      case 'wrong-password':
        return AuthFailure("Incorrect password. Please try again.");
      case 'account-exists-with-different-credential':
        return AuthFailure(
            "This email is already in use. Please try another email address.");
      case 'user-cancelled':
        return AuthFailure("Login cancelled.");
      case 'network-request-failed':
        return AuthFailure(
            "No internet connection. Please check your network and try again.");
      case 'too-many-requests':
        return AuthFailure(
            "Too many failed login attempts. Please try again later.");
      default:
        return AuthFailure("Something went wrong. Please try again.");
    }
  }

  // TODO: Implement fromSupabaseAuthException if needed.
}
