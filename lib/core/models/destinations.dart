import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// for bottom navigation
class Destinations {
  final String label;
  final IconData icon;

  const Destinations({required this.label, required this.icon});
}

const List<Destinations> destinations = <Destinations>[
  Destinations(label: 'Home', icon: IconsaxPlusLinear.home_2),
  Destinations(label: 'favorites', icon: IconsaxPlusLinear.heart),
  Destinations(label: 'Cart', icon: IconsaxPlusLinear.bag_2),
  Destinations(label: 'Profile', icon: IconsaxPlusLinear.profile),
];
