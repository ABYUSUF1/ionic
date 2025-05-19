import 'package:dartz/dartz.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/utils/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, AuthEntity>> signInWithGoogle();

  Future<Either<Failure, void>> sendPasswordResetEmail(String email);

  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, bool>> isEmailVerified();

  Future<Either<Failure, AuthEntity?>> getCurrentUser();
}
