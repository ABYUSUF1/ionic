import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:ionic/core/services/auth/firebase_auth_service.dart';
import 'package:ionic/core/services/messaging/firebase_messaging_service.dart';
import 'package:ionic/features/auth/data/data_source/remote/auth_firestore_service.dart';
import 'package:ionic/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSource {
  final FirebaseAuthService _firebaseAuthService;
  final AuthFirestoreService _authFirestoreService;
  final FirebaseMessagingService _firebaseMessagingService;
  AuthRemoteDataSource({
    required FirebaseAuthService firebaseAuthService,
    required AuthFirestoreService authFirestoreService,
    required FirebaseMessagingService firebaseMessagingService,
  }) : _firebaseAuthService = firebaseAuthService,
       _authFirestoreService = authFirestoreService,
       _firebaseMessagingService = firebaseMessagingService;

  /// Attempts to sign in a user with the provided email and password.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      debugPrint('Error signing in with email/password: $e');
      rethrow; // Propagate to the repository
    } catch (e) {
      debugPrint('Unexpected error signing in: $e');
      rethrow;
    }
  }

  /// Attempts to sign up a new user with email and password, and stores their initial data in Firestore.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      final userCredential = await _firebaseAuthService
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
          );
      final user = userCredential.user;
      if (user != null) {
        final authModel = AuthModel(
          id: user.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          isEmailVerified: user.emailVerified,
          photoUrl: null,
          phoneNumber: phoneNumber,
          gender: null,
          birthDate: null,
          fcmToken: await _firebaseMessagingService.getToken(),
        );
        await _authFirestoreService.addUser(authModel: authModel);
      } else {
        throw Exception('Failed to create Firebase Auth user.');
      }
    } on FirebaseException catch (authError) {
      debugPrint('Firebase Auth error during sign up: $authError');
      rethrow; // Propagate the authentication exception
    } on FirebaseFirestore catch (firestoreError) {
      debugPrint('Firestore error during sign up: $firestoreError');
      rethrow; // Propagate the Firestore exception
    } catch (e) {
      debugPrint('Unexpected error during sign up: $e');
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await _firebaseAuthService.signInWithGoogle();

      final user = userCredential.user;
      if (user != null) {
        final authModel = AuthModel(
          id: user.uid,
          firstName: user.displayName?.split(' ').first ?? '',
          lastName: user.displayName?.split(' ').skip(1).join(' ') ?? '',
          email: user.email!,
          photoUrl: user.photoURL ?? '',
          isEmailVerified: user.emailVerified,
          phoneNumber: user.phoneNumber ?? '',
          gender: null,
          birthDate: null,
          fcmToken: await _firebaseMessagingService.getToken(),
        );
        await _authFirestoreService.addUser(authModel: authModel);
      } else {
        throw Exception('Failed to sign in with Google: user is null');
      }
    } on FirebaseException catch (e) {
      debugPrint('Error signing in with Google: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error signing in with Google: $e');
      rethrow;
    }
  }

  /// Attempts to sign out the currently logged-in user.
  Future<void> signOut() async {
    try {
      await _firebaseAuthService.signOut();
    } on FirebaseException catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error signing out: $e');
      rethrow;
    }
  }

  /// Sends a password reset email to the provided email address.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuthService.sendPasswordResetEmail(email);
    } on FirebaseException catch (e) {
      debugPrint('Error sending password reset email: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error sending password reset email: $e');
      rethrow;
    }
  }

  /// Check if a user with the provided email already exists in the database.
  Future<bool> isEmailExists(String email) async {
    try {
      final isEmailExists = await _authFirestoreService.isEmailExists(email);
      return isEmailExists;
    } on FirebaseException catch (e) {
      debugPrint('Error checking email existence: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error checking email existence: $e');
      rethrow;
    }
  }

  /// Sends an email verification link to the currently logged-in user's email address.
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuthService.sendEmailVerification();
    } on FirebaseException catch (e) {
      debugPrint('Error sending email verification: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error sending email verification: $e');
      rethrow;
    }
  }

  /// Checks if the current user's email has been verified.
  Future<bool> isEmailVerified() async {
    try {
      return await _firebaseAuthService.isEmailVerified();
    } on FirebaseException catch (e) {
      debugPrint('Error checking email verification status: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error checking email verification status: $e');
      rethrow;
    }
  }

  /// Returns the currently logged-in user's basic information from Firebase Auth.
  ///! Bec there data like gender, birthDate we cant get them from firebase auth
  ///! we have to get them from firestore!
  ///! so if anyway we will use firestore, we dont to use currentUser from firebase Auth
  // AuthModel? get currentUser {
  //   try {
  //     final user = _firebaseAuthService.currentUser;
  //     if (user == null) return null;
  //     return AuthModel(
  //       id: user.uid,
  //       firstName: user.displayName?.split(' ').first ?? '',
  //       lastName:
  //           user.displayName?.split(' ').skip(1).join(' ') ??
  //           '', // Handle cases with single name
  //       email: user.email ?? '',
  //       isEmailVerified: user.emailVerified,
  //       photoUrl: user.photoURL,
  //       phoneNumber: user.phoneNumber,
  //       gender: null,
  //       birthDate: null,
  //     );
  //   } catch (e) {
  //     debugPrint('Error getting current user basic info: $e');
  //     return null; // Or consider throwing, depending on your error handling
  //   }
  // }

  // Fetch user details from Firestore based on their ID
  Future<AuthModel?> getCurrentUser() async {
    try {
      return await _authFirestoreService.getUser(
        userId: _firebaseAuthService.currentUser!.uid,
      );
    } catch (e) {
      debugPrint('Error fetching user details: $e');
      return null; // Or consider throwing, depending on your error handling
    }
  }

  Future<void> updateUser({required AuthModel authModel}) async {
    try {
      await _authFirestoreService.updateUser(authModel: authModel);
    } on FirebaseException catch (e) {
      debugPrint('Error updating user: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error updating user: $e');
      rethrow;
    }
  }

  Future<void> updateUserEmailVerifiedStatus({
    required bool isEmailVerified,
  }) async {
    try {
      await _authFirestoreService.updateIsEmailVerified(
        userId: _firebaseAuthService.currentUser!.uid,
        isEmailVerified: isEmailVerified,
      );
    } on FirebaseException catch (e) {
      debugPrint('Error updating email verified status: $e');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error updating email verified status: $e');
      rethrow;
    }
  }

  Future<void> deleteUserAndData({required String password}) async {
    try {
      await _authFirestoreService.deleteUserAccountAndData();
      await _firebaseAuthService.deleteUser(password: password);
    } on FirebaseException catch (e) {
      debugPrint('❌ Firebase error while deleting user: $e');
      rethrow;
    } catch (e) {
      debugPrint('❌ Unexpected error while deleting user: $e');
      rethrow;
    }
  }
}
