import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/routing/app_route.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/services/data_source/local/object_box_service.dart';
import 'core/theme/manager/cubit/theme_cubit.dart';
import 'features/auth/domain/repo/auth_repo.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();

  FlutterNativeSplash.remove();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      child: DevicePreview(
        builder: (context) {
          return IonicApp();
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
        BlocProvider(
          create: (context) => ThemeCubit(getIt<ObjectBoxService>()),
        ),
        BlocProvider(create: (context) => AuthCubit(getIt<AuthRepo>())),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
