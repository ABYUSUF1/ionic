import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';

import '../../../auth/data/models/auth_model.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, void>> updateUser({required AuthModel authModel});

  Future<Either<Failure, void>> deleteAccount();

  Future<Either<Failure, void>> signOut();
}
