import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/splash%20&%20onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Get.off(
          () => const OnboardingScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/UISI.png",
                width: 130,
              ),
              const SizedBox(height: 30),
              const Text(
                "SkinSense AI",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2E8B57),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Personalized Skincare\nRecommendation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 60),
              const SizedBox(
                width: 150,
                child: LinearProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}