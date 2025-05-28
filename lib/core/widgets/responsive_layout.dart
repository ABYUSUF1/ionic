import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileChild;
  final Widget tabletChild;
  const ResponsiveLayout({
    super.key,
    required this.mobileChild,
    required this.tabletChild,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth < 600) {
      return mobileChild;
    } else {
      return tabletChild;
    }
  }
}
