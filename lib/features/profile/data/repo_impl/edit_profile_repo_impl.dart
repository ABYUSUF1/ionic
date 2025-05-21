import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/auth/data/data_source/remote/auth_remote_data_source.dart';

import '../../../../core/utils/errors/auth_failure.dart';
import '../../../../core/utils/errors/platform_failure.dart';
import '../../../auth/data/models/auth_model.dart';
import '../../domain/repo/edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  EditProfileRepoImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUser({
    required AuthModel authModel,
  }) async {
    try {
      await _authRemoteDataSource.updateUser(authModel: authModel);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure(
          'An unexpected error occurred during changing full name. Please try again.',
        ),
      );
    }
  }
}
