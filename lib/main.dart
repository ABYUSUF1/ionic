import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/routing/app_route.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(
    DevicePreview(
      builder: (context) {
        return IonicApp();
      },
    ),
  );
}

class IonicApp extends StatelessWidget {
  const IonicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
