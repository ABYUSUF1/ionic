import 'package:flutter/material.dart';

// --- Create a global key for ScaffoldMessengerState ---
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showOfflineBanner(BuildContext context) {
  scaffoldMessengerKey.currentState!.showSnackBar(
    SnackBar(
      duration: const Duration(days: 365),
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You are offline',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.wifi_off, color: Colors.white),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.error,
    ),
  );
}

void showOnlineSnackBar(BuildContext context) {
  scaffoldMessengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi, color: Colors.black),
            SizedBox(width: 5),
            Text('You are online', style: TextStyle(color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.greenAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
}
