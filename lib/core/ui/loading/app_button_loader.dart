import 'package:flutter/material.dart';
import 'app_loading.dart';

class AppButtonLoader extends StatelessWidget {
  final double size;

  const AppButtonLoader({
    super.key,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AppLoading(
        size: size,
        color: Colors.white,
      ),
    );
  }
}
