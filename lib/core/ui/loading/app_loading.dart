import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const AppLoading({
    super.key,
    this.size = 32,
    this.strokeWidth = 3,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
