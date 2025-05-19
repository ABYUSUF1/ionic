import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/models/destinations.dart';

class MainBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: theme.colorScheme.secondary,
        destinations:
            destinations
                .map(
                  (destination) => NavigationDestination(
                    icon: Icon(destination.icon),
                    label: destination.label,
                    selectedIcon: Icon(
                      destination.icon,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
