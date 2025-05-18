import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/features/auth/presentation/views/sign_in_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: SignInView(),
    );
  }
}
