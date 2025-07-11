import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class NormalLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const NormalLoading({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      child: FadeInDown(
        duration: const Duration(milliseconds: 500),
        from: 20,
        child: Lottie.asset(
          AppAssets.lottiesLoadingAnimation,
          width: width ?? 50,
          height: height ?? 50,
        ),
      ),
    );
  }
}
