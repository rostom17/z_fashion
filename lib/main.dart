import 'package:flutter/material.dart';

import 'package:z_fashion/features/onboard/presentation/screens/splash_screen.dart';

void main() {
  runApp(const ZFashion());}


class ZFashion extends StatelessWidget {
  const ZFashion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}