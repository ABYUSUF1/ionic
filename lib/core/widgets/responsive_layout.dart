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
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileChild;
        } else {
          return tabletChild;
        }
      },
    );
  }
}
