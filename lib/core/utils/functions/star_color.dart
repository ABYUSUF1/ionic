import 'package:flutter/material.dart';

Color starColor(double rating) {
  if (rating >= 4.5) {
    return Colors.green;
  } else if (rating >= 3.5) {
    return Colors.yellow;
  } else if (rating >= 2.5) {
    return Colors.orange;
  } else if (rating >= 1.5) {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}
