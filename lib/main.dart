import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ionic/core/routing/app_route.dart';
import 'package:ionic/core/services/data_source/local/local_app_settings_service.dart';
import 'package:ionic/core/services/data_source/local/object_box_service.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/services/network/network_cubit.dart';
import 'package:ionic/core/services/network/network_widget.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:ionic/firebase_options.dart';
import 'package:ionic/generated/codegen_loader.g.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/manager/cubit/theme_cubit.dart';
import 'features/address/domain/repo/address_repo.dart';
import 'features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'features/auth/domain/repo/auth_repo.dart';
import 'features/favorite/domain/repo/favorite_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISH_TEST_KEY']!;
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  await setupGetIt();

  // await getIt<ObjectBoxService>().deleteAllData();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      ignorePluralRules: false,
      assetLoader: const CodegenLoader(),
      child: DevicePreview(
        builder: (context) {
          return const IonicApp();
        },
      ),
    ),
  );
}

class IonicApp extends StatelessWidget {
  const IonicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkCubit(getIt())),
        BlocProvider(
          create: (context) => ThemeCubit(getIt<LocalAppSettingsService>()),
        ),
        BlocProvider(create: (context) => AuthCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => FavoriteCubit(getIt<FavoriteRepo>())),
        BlocProvider(create: (context) => CartCubit(getIt<CartRepo>())),
        BlocProvider(
          create: (context) => DefaultAddressCubit(getIt<AddressRepo>()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp.router(
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme:
                isDarkMode
                    ? AppTheme.darkTheme(context)
                    : AppTheme.lightTheme(context),
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
            builder: (context, child) {
              return BlocBuilder<NetworkCubit, NetworkStatus>(
                builder: (context, state) {
                  if (state == NetworkStatus.disconnected) {
                    return EmptyStateWidget(
                      title: context.tr(LocaleKeys.network_no_internet),
                      subtitle: context.tr(LocaleKeys.network_no_internet_desc),
                    );
                  }
                  return BlocListener<NetworkCubit, NetworkStatus>(
                    listener: (context, state) {
                      if (state == NetworkStatus.connected) {
                        showOnlineSnackBar(context);
                      }
                    },
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
