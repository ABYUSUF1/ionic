import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/routing/app_route.dart';
import 'package:ionic/core/services/data_source/local/local_app_settings_service.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/services/network/network_cubit.dart';
import 'package:ionic/core/services/network/network_widget.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:ionic/firebase_options.dart';
import 'package:ionic/generated/codegen_loader.g.dart';

import 'core/theme/manager/cubit/theme_cubit.dart';
import 'features/auth/domain/repo/auth_repo.dart';
import 'features/favorite/domain/repo/favorite_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      assetLoader: const CodegenLoader(),
      child: DevicePreview(
        builder: (context) {
          return const IonicApp(); // Use const here as IonicApp is StatelessWidget
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
        BlocProvider(create: (context) => NetworkCubit()),
        BlocProvider(
          create: (context) => ThemeCubit(getIt<LocalAppSettingsService>()),
        ),
        BlocProvider(create: (context) => AuthCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => FavoriteCubit(getIt<FavoriteRepo>())),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp.router(
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
            builder: (context, child) {
              return BlocListener<NetworkCubit, bool>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, isOnline) {
                  if (isOnline) {
                    showOnlineSnackBar(scaffoldMessengerKey.currentContext!);
                  } else {
                    showOfflineBanner(scaffoldMessengerKey.currentContext!);
                  }
                },
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
