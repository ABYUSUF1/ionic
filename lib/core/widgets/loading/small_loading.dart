import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SmallLoading extends StatelessWidget {
  final Color? color;
  const SmallLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(color: color ?? primaryColor),
      ),
    );
  }
}
