import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ionic/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/utils/errors/auth_failure.dart';
import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/errors/platform_failure.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = await _remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Left(
          Failure(
            'Failed to retrieve user data after sign-in. Please try again.',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during sign-in. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      await _remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );
      final user = await _remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Left(
          Failure(
            'Failed to retrieve user data after sign-up. Please try again.',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during sign-up. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during sign-out. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      final isEmailExists = await _remoteDataSource.isEmailExists(email);

      if (!isEmailExists) {
        return const Left(
          Failure('This email is not registered, sign up first.'),
        );
      }

      await _remoteDataSource.sendPasswordResetEmail(email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred while sending password reset email. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      await _remoteDataSource.sendEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred while sending email verification. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      final isVerified = await _remoteDataSource.isEmailVerified();
      return Right(isVerified);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred while checking email verification. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    try {
      await _remoteDataSource.signInWithGoogle();
      final user = await _remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Left(
          Failure(
            'Failed to retrieve user data after sign-up. Please try again.',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during sign-in with Google. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntity?>> getCurrentUser() async {
    try {
      final user = await _remoteDataSource.getCurrentUser();
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during getting current user. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserAndData({
    required String password,
  }) async {
    try {
      await _remoteDataSource.deleteUserAndData(password: password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during sign-in. Please try again.',
        ),
      );
    }
  }
}
