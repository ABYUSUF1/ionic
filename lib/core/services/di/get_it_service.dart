import 'package:get_it/get_it.dart';
import 'package:ionic/core/services/image_picker/cubit/cubit/image_picker_cubit.dart';
import 'package:ionic/core/services/image_picker/image_picker_service.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:ionic/features/profile/data/repo_impl/edit_profile_repo_impl.dart';
import 'package:ionic/features/profile/domain/repo/edit_profile_repo.dart';

import '../../../features/auth/data/data_source/remote/auth_firestore_service.dart';
import '../../../features/auth/data/data_source/remote/auth_remote_data_source.dart';
import '../../../features/auth/data/repo_imple/auth_repo_impl.dart';
import '../../../features/auth/domain/repo/auth_repo.dart' show AuthRepo;
import '../../../features/auth/presentation/manager/email_sent/email_sent_cubit.dart';
import '../../../features/auth/presentation/manager/sign_up/sign_up_cubit.dart';
import '../../../features/profile/presentation/manager/cubit/edit_profile_cubit.dart';
import '../../theme/manager/cubit/theme_cubit.dart';
import '../auth/firebase_auth_service.dart';
import '../data_source/local/local_app_settings_service.dart';
import '../data_source/local/object_box_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register Services
  final objectBoxService = await ObjectBoxService.init();
  getIt.registerSingleton<ObjectBoxService>(objectBoxService);
  getIt.registerSingleton(LocalAppSettingsService(objectBoxService));
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => AuthFirestoreService());
  getIt.registerLazySingleton(() => ImagePickerService());

  // Register Data Sources
  getIt.registerLazySingleton(
    () => AuthRemoteDataSource(
      firebaseAuthService: getIt(),
      authFirestoreService: getIt(),
    ),
  );

  // Register Repositories
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepoImpl(getIt()),
  );

  // Register BLoCs/Cubits

  getIt.registerFactory(() => ThemeCubit(getIt()));
  getIt.registerFactory(() => ImagePickerCubit(getIt()));
  getIt.registerFactory(() => SignInCubit(getIt()));
  getIt.registerFactory(() => SignUpCubit(getIt()));
  getIt.registerFactory(() => EmailSentCubit(getIt()));
  getIt.registerFactory(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerFactory(() => EditProfileCubit(getIt()));
}
