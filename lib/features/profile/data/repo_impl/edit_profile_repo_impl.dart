import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ionic/core/services/storage/buckets_name.dart';
import 'package:ionic/core/services/storage/supabase_storage_service.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/auth/data/data_source/remote/auth_remote_data_source.dart';

import '../../../../core/utils/errors/auth_failure.dart';
import '../../../../core/utils/errors/platform_failure.dart';
import '../../../auth/data/models/auth_model.dart';
import '../../domain/repo/edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final SupabaseStorageService _storageService;

  EditProfileRepoImpl(this._authRemoteDataSource, this._storageService);

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

  @override
  Future<Either<Failure, String>> uploadProfileImage({
    required Uint8List imageBytes,
    required String imageName,
  }) async {
    try {
      ;
      final String? imageUrl = await _storageService.uploadImage(
        imageBytes: imageBytes,
        imageName: imageName,
        bucketName: BucketsName.profileImages,
      );
      if (imageUrl == null) {
        return const Left(
          Failure('Failed to upload profile image. Please try again.'),
        );
      }
      return Right(imageUrl);
    } on PlatformException catch (e) {
      return Left(PlatformFailure.fromCode(e));
    } catch (e) {
      return const Left(
        Failure('Failed to upload profile image. Please try again.'),
      );
    }
  }
}
