import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';

import '../../../../core/constants/app_assets.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({super.key});

  @override
  State<HomeAds> createState() => _HomeAdsState();
}

class _HomeAdsState extends State<HomeAds> {
  final PageController _controller = PageController(
    viewportFraction: 0.8,
    initialPage: 1000, // Start at high index for infinite scroll illusion
  );
  Timer? _timer;

  static const List<String> _ads = <String>[
    AppAssets.adsAd1,
    AppAssets.adsAd2,
    AppAssets.adsAd3,
    AppAssets.adsAd4,
    AppAssets.adsAd5,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      try {
        if (_controller.hasClients) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      } catch (e, stackTrace) {
        debugPrint("Error in auto scroll: $e\n$stackTrace");
      }
    });
  }

  Widget _buildPage(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double opacity = 0.5;
        double scale = 0.9;

        if (_controller.position.haveDimensions) {
          final page = _controller.page ?? 0;
          final delta = (page - index).abs();
          opacity = (1 - delta * 0.7).clamp(0.5, 1.0);
          scale = (1 - delta * 0.1).clamp(0.9, 1.0);
        }

        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(_ads[index % _ads.length]),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: ResponsiveLayout.isMobile(context) ? 150 : 230,
        child: PageView.builder(
          controller: _controller,
          itemCount: 2000, // Large number for infinite scroll effect
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _buildPage(index),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
