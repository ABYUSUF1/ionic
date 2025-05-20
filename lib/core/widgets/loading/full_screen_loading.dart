import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

bool _isLoadingVisible = false;

Future<void> showFullScreenLoading(BuildContext context, String message) async {
  if (_isLoadingVisible) return;
  _isLoadingVisible = true;

  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: const Color(0xDD151515),
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  message,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Lottie.asset(
                AppAssets.lottiesLoadingAnimation,
                width: 80,
                height: 80,
                repeat: true,
              ),
            ],
          ),
        ),
      );
    },
  );

  _isLoadingVisible = false;
}

void closeFullScreenLoading(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  }
}
