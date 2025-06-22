import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/api/dio_api_client.dart';
import 'package:ionic/core/services/image_picker/cubit/cubit/image_picker_cubit.dart';
import 'package:ionic/core/services/image_picker/image_picker_service.dart';
import 'package:ionic/core/services/messaging/firebase_messaging_service.dart';
import 'package:ionic/core/services/network/network_cubit.dart';
import 'package:ionic/features/address/data/data_source/address_remote_data_source.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';
import 'package:ionic/features/address/presentation/manager/locate_on_map/locate_on_map_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:ionic/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:ionic/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ionic/features/cart/data/repo_impl/cart_repo_impl.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/categories/data/repo_impl/categories_repo_impl.dart';
import 'package:ionic/features/categories/domain/repo/categories_repo.dart';
import 'package:ionic/features/favorite/data/data_sources/remote/favorite_remote_data_source.dart';
import 'package:ionic/features/favorite/data/repo_impl/favorite_repo_impl.dart';
import 'package:ionic/features/favorite/domain/repo/favorite_repo.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';
import 'package:ionic/features/home/presentation/manager/categories/home_categories_cubit.dart';
import 'package:ionic/features/orders/data/repo_impl/orders_repo_impl.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:ionic/features/payment/data/data_source/paymob_payment_service.dart';
import 'package:ionic/features/payment/data/data_source/stripe_payment_service.dart';
import 'package:ionic/features/payment/data/repo_impl/payment_repo_impl.dart';
import 'package:ionic/features/payment/domain/repo/payment_repo.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:ionic/features/product/data/repo_impl/product_repo_impl.dart';
import 'package:ionic/features/product/domain/repo/product_repo.dart';
import 'package:ionic/features/product/presentation/manager/cubit/product_cubit.dart';
import 'package:ionic/features/profile/data/repo_impl/edit_profile_repo_impl.dart';
import 'package:ionic/features/profile/domain/repo/edit_profile_repo.dart';
import 'package:ionic/features/search/data/repo_impl/search_repo_impl.dart';
import 'package:ionic/features/search/domain/repo/search_repo.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:location/location.dart';

import '../../../features/address/data/repo_impl/address_repo_impl.dart';
import '../../../features/auth/data/data_source/remote/auth_firestore_service.dart';
import '../../../features/auth/data/data_source/remote/auth_remote_data_source.dart';
import '../../../features/auth/data/repo_imple/auth_repo_impl.dart';
import '../../../features/auth/domain/repo/auth_repo.dart' show AuthRepo;
import '../../../features/auth/presentation/manager/email_sent/email_sent_cubit.dart';
import '../../../features/auth/presentation/manager/sign_up/sign_up_cubit.dart';
import '../../../features/home/data/repo_impl/home_repo_impl.dart';
import '../../../features/profile/presentation/manager/cubit/edit_profile_cubit.dart';
import '../../theme/manager/cubit/theme_cubit.dart';
import '../auth/firebase_auth_service.dart';
import '../data_source/local/local_app_settings_service.dart';
import '../data_source/local/object_box_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register Services
  getIt.registerSingleton<Connectivity>(Connectivity());
  final objectBoxService = await ObjectBoxService.init();
  getIt.registerSingleton<ObjectBoxService>(objectBoxService);
  getIt.registerSingleton(LocalAppSettingsService(objectBoxService));
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => AuthFirestoreService());
  getIt.registerLazySingleton(() => FirebaseMessagingService(getIt()));
  getIt.registerLazySingleton(() => ImagePickerService());
  getIt.registerLazySingleton<ApiClient>(() => DioApiClient(Dio()));
  getIt.registerLazySingleton<Location>(() => Location());

  // Register Data Sources
  getIt.registerLazySingleton(
    () => AuthRemoteDataSource(
      firebaseAuthService: getIt(),
      authFirestoreService: getIt(),
      firebaseMessagingService: getIt(),
    ),
  );
  getIt.registerLazySingleton(() => FavoriteRemoteDataSource());
  getIt.registerLazySingleton(() => AddressRemoteDataSource());
  getIt.registerLazySingleton(() => CartRemoteDataSource());
  getIt.registerLazySingleton(() => CartLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => StripePaymentService(getIt()));
  getIt.registerLazySingleton(() => PaymobPaymentService());

  // Register Repositories
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl(getIt()));
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(getIt()));
  getIt.registerLazySingleton<AddressRepo>(
    () => AddressRepoImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl(getIt(), getIt()));
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepoImpl());

  // Register BLoCs/Cubits
  getIt.registerFactory(() => NetworkCubit(getIt()));
  getIt.registerFactory(() => ThemeCubit(getIt()));
  getIt.registerFactory(() => ImagePickerCubit(getIt()));
  getIt.registerFactory(() => SignInCubit(getIt()));
  getIt.registerFactory(() => SignUpCubit(getIt()));
  getIt.registerFactory(() => EmailSentCubit(getIt()));
  getIt.registerFactory(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerFactory(() => EditProfileCubit(getIt()));
  getIt.registerFactory(() => HomeCategoriesCubit(getIt()));
  getIt.registerFactory(() => FavoriteCubit(getIt()));
  getIt.registerFactory(() => SearchCubit(getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));
  getIt.registerFactory(() => LocateOnMapCubit(getIt()));
  getIt.registerFactory(() => CartCubit(getIt()));
  getIt.registerFactory(() => PaymentCubit(getIt()));
  getIt.registerFactory(() => OrdersCubit(getIt()));
}
