import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/auth/data/data_source/remote/auth_firestore_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final AuthFirestoreService _authFirestoreService;

  FirebaseMessagingService(this._authFirestoreService);

  // Call this when user logs in
  Future<void> init(String userId) async {
    await firebaseMessaging.requestPermission();

    final token = await getToken();
    if (token != null) {
      await _authFirestoreService.updateFcmToken(
        userId: userId,
        fcmToken: token,
      );
    }

    // Listen for token refresh
    firebaseMessaging.onTokenRefresh.listen((newToken) async {
      await _authFirestoreService.updateFcmToken(
        userId: userId,
        fcmToken: newToken,
      );
    });
  }

  // Get Token
  Future<String?> getToken() async {
    final token = await firebaseMessaging.getToken();
    return token;
  }

  // Handle notification taps when app is terminated
  Future<void> handleInitialMessage(Function(RemoteMessage) onTap) async {
    final initialMessage = await firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      onTap(initialMessage);
    }
  }

  // Handle notification taps when app is in background
  void listenToMessageTap(Function(RemoteMessage) onTap) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      onTap(message);
    });
  }
}

///! It Must Be Outside any class
// Handle background message
Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  try {
    final title = message.notification?.title;
    final body = message.notification?.body;
  } catch (e, s) {
    debugPrint('❌ Error in background handler: $e');
    debugPrint('📍 Stack trace:\n$s');
  }
}
