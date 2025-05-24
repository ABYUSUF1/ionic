import 'dart:async';

import 'package:flutter/material.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({super.key});

  @override
  State<HomeAds> createState() => _HomeAdsState();
}

class _HomeAdsState extends State<HomeAds> {
  final PageController pageController = PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(child: AutoLoopingPageView());
  }
}

class AutoLoopingPageView extends StatefulWidget {
  const AutoLoopingPageView({super.key});

  @override
  State<AutoLoopingPageView> createState() => _AutoLoopingPageViewState();
}

class _AutoLoopingPageViewState extends State<AutoLoopingPageView> {
  final PageController _controller = PageController(
    viewportFraction: 0.8,
    initialPage: 1000, // Start at high index for infinite scroll illusion
  );
  final List<Color> _colors = [Colors.blue, Colors.green, Colors.orange];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_controller.hasClients) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildPage(int index) {
    final colorIndex = index % _colors.length;
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
                color: _colors[colorIndex],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Page ${colorIndex + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildPage(index),
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
