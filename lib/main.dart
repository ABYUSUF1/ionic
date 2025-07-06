import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/services/messaging/firebase_messaging_service.dart';
import 'package:ionic/firebase_options.dart';
import 'package:ionic/generated/codegen_loader.g.dart';
import 'package:ionic/ionic_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

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

  // ✅ Register the top-level background message handler
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
  await FirebaseMessaging.instance.requestPermission();

  // await getIt<ObjectBoxService>().deleteAllData();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      ignorePluralRules: false,
      assetLoader: const CodegenLoader(),
      child: const IonicApp(),
    ),
  );
}
