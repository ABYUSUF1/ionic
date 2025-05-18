import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../data/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthModel>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthModel>> resetPassword({required String email});
  Future<Either<Failure, AuthModel>> createNewPassword({
    required String newPassword,
  });
  Future<Either<Failure, AuthModel>> verifyEmail({
    required String email,
    required String otp,
  });
}
