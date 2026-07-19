import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/views/splash%20&%20onboarding/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SkinSenseApp());
}

class SkinSenseApp extends StatelessWidget {
  const SkinSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'SkinSense AI',
      home: const SplashScreen(),
    );
  }
}
